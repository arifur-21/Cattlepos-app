
import 'package:cattle_pos_app/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/utils.dart';

class ReceiptViewModel extends GetxController{

  final _repository = Repository();

  RxString currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now()).obs;
  RxString currentTime = DateFormat("hh:mm:ss a").format(DateTime.now()).obs;
  final byerNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final priceController = TextEditingController().obs;

  RxBool loading = false.obs;
  RxString cattleTyle = ''.obs;

  void addReceiptData(dynamic cattleType){
    print("byer name ${byerNameController.value.text}");
    print("cattle ${cattleType}");
    loading.value = true;
    Map data = {
      "buyer_name": byerNameController.value.text,
      "phone_number": phoneController.value.text,
      "cattle_type": cattleType,
      "price": priceController.value.text,
      "hasil": "200",
    };

    _repository.addReceiptData(data).then((value){
      loading.value = false;
      Utils.snakBar("Post Receipt", "Add Receipt Successfull");
      print("value ${value}");
    }).onError((error, stackTrace) {
      print("login vm error : ${error.toString()}");
      loading.value = false;
      Utils.snakBar("Error", error.toString());

    });

  }


}