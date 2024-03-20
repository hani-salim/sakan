import 'package:dio/dio.dart';
import 'package:sakan/core/constant/constant.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"}));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    return await dio!.get(url, queryParameters: query, data: data);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Map<String, dynamic> data}) async {
    return await dio!.post(url, data: data, queryParameters: queryParameters);
  }
}
