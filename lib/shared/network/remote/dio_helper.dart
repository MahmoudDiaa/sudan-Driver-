import 'package:dio/dio.dart';

class DioHelper {

  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://46.105.236.12:6050/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic>? query,

    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,

    String? token,
  }) async {
    dio!.options.headers = {

      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.post(path, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {

      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await dio!.put(path, queryParameters: query, data: data);
  }



}
