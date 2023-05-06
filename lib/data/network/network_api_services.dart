
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cattle_pos_app/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';

class NetworkApiServics extends BaseApiServices{

  @override
  Future postApi(var data, String url) async {
    dynamic responseJson;
    try {

      final response = await http.post(Uri.parse(url), body: data).timeout(
          Duration(seconds: 30));
      responseJson = returnResponse(response);
    } catch(e){
      if(e is SocketException){
        throw InternetException("No Internet");
      }else if(e is TimeoutException){
        throw RequestTimeOut('Request Time Out');
      }
      throw e.toString();
    }
    return responseJson;
  }


  @override
  Future<List> getListOfApiData(String url)async{
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse(url)).timeout(Duration(seconds: 30));
      responseJson = returnResponse(response);
    } catch(e){
      if(e is SocketException){
        throw InternetException("No Internet");
      }else if(e is TimeoutException){
        throw RequestTimeOut('Request Time Out');
      }
      throw e.toString();
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidUrlException;
      default:
        throw featchDataException(
            "Error accoured while communication with server" +
                response.statusCode.toString());
    }
  }


}