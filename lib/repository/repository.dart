
import 'package:cattle_pos_app/data/network/network_api_services.dart';
import 'package:cattle_pos_app/models/user_login_model.dart';

import '../resources/app_url/app_url.dart';

class Repository{

  final _apiServices = NetworkApiServics();

  //post user
  Future<dynamic> loginUser(data)async{
    dynamic response = await _apiServices.postApi(data, AppUrl.logiUrl);
    return response;
  }

  //get user login data
  List<UserLoginModel> userLoginList = [];
  Future<List<UserLoginModel>> getLoginUserData()async{

    dynamic response = await _apiServices.getListOfApiData(AppUrl.getLoginUserUrl);
    print("response repo ${response.toString()}");

    userLoginList.clear();
    for(Map i in response){
      UserLoginModel data =  UserLoginModel.fromJson(i);
      userLoginList.add(data);
    }
    return userLoginList;
  }


  Future<dynamic> addReceiptData(data)async{
    dynamic response = await _apiServices.postApi(data, AppUrl.postReceiptUrl);
    return response;
  }


}