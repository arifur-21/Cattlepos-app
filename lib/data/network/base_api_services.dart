abstract class BaseApiServices{

  ////post api
  Future<dynamic> postApi(dynamic data, String url);
  Future<List<dynamic>> getListOfApiData(String url);
}