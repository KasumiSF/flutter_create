import 'package:dio/dio.dart';


class BaseApi {
  static String http = "http://beta90api.easttone.com";
  static String proname = "/sh-interview-admin";

  static String proaddress = http+proname;

  final  Dio dio = new Dio();
  Future<Object> BasePost(String url,Map map) async {
    print("======================================================");
    print("发起网络请求！============${proaddress+url}");
    print("网络请求参数！============${map}");
    try{
      Response response;
      response =await dio.post(proaddress+url, data: map,
        options: Options(headers: {"accessToken":'1'},),
      );
      print("网络请求成功！============${response.data}");
      print("======================================================");
      return response.data;

    }catch(e){
      print("网络请求出错！============${e}");
      print("======================================================");

      return null;
    }
  }


  Future<Object> BasePost_x(String url,Map map) async {
    print("======================================================");
    print("发起网络请求！============${url}");
    print("网络请求参数！============${map}");
    try{
      Response response;
      response =await dio.post(url, data: map,
        options: Options(headers: {"accessToken":'1'},),
      );
      print("网络请求成功！============${response.data}");
      print("======================================================");
      return response.data;

    }catch(e){
      print("网络请求出错！============${e}");
      print("======================================================");

      return null;
    }
  }

//  Future<List> get_ganklist(Map map) async{
//    Response response;
//    response = await dio.post('http://beta90api.easttone.com/sh-interview-admin/topic/topic/getTopicList', data: map,
//      options: Options(
//        headers: {
//          'accessToken':"1",},
//      ),);
//    print(response.data['data']['records']);
//    return  response.data['data']['records'];
//  }


}