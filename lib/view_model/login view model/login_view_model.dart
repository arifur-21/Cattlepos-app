
import 'package:cattle_pos_app/models/user_login_model.dart';
import 'package:cattle_pos_app/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';
import '../../utils/utils.dart';

class LoginViewModel extends GetxController{

  final _repository = Repository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final rxRequestStatus = Status.LOADING.obs;
  final loginUserDataList = <UserLoginModel>[].obs;
  RxString error = ''.obs;


  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setLoginUserData(List<UserLoginModel> _value) => loginUserDataList.value = _value;
  void setError(String _value) => error.value = _value;

  RxBool loading = false.obs;


  //registration full form
  void userLogin(){
    print(emailController);
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,

    };

    _repository.loginUser(data).then((value){
      loading.value = false;
      Utils.snakBar("Login", "Login Successfull");
      print("value ${value}");
    }).onError((error, stackTrace) {
      print("login vm error : ${error.toString()}");
      loading.value = false;
      Utils.snakBar("Error", error.toString());

    });

  }


  //get surgery not data
  Future<List<UserLoginModel>> getLoginUserData()async{
    setRxRequestStatus(Status.LOADING);
    _repository.getLoginUserData().then((value) {
      print("note ${value}");
      setRxRequestStatus(Status.SUCCESS);
      setLoginUserData(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
      print("vm error get surgery note ${error.toString()}");
    });

    return loginUserDataList;
  }

}