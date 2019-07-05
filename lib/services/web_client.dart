import 'package:dio/dio.dart';
import 'package:upday_assignment/constants/api.dart';
import 'dart:io';


final Dio dio = new Dio()
  ..options.baseUrl = Api.baseUrl
  ..options.receiveTimeout
  ..options.contentType = ContentType.json
  ..options.headers = {'Authorization': 'Basic YTg3MmUtZmYzZWEtNzM0NzYtMGU2MjctOWFiYmMtM2IxYjQ6MjFhNGUtMzk4MmQtYTIzYmEtYzE2OTUtNTI0MzYtOTM2NGI='};


class WebClient {
  const WebClient();

  dynamic commonBehavior(Response response) {
    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.data);
    }
    return response.data;
  }

  Future<dynamic> get(String uri, [data]) async {
    final Response response = await dio.get(uri, queryParameters: data);
  //  final Response response = await dio.get(uri,);    //get(Api.baseUrl,data);//, data: data);
    return commonBehavior(response);
  }





  Future<dynamic> post(String uri, dynamic data) async {
    try {

      final Response response = await dio.post(uri, data: data);
      return commonBehavior(response);
    } catch (e)
    {
      throw ('An error occurred');
    }
  }

  Future<dynamic> put(String uri, dynamic data) async {
    try {
      final Response response = await dio.put(uri, data: data);
      return commonBehavior(response);
    } catch (e) {
      throw ('An error occurred');
    }
  }
}

final WebClient http = new WebClient();
