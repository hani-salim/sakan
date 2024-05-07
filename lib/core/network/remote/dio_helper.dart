import 'package:dio/dio.dart';
import '../../constant/constant.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"}));
  }

  static  getData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data}) async {
    return await dio!.get(url, queryParameters: query, data: data);
  }

  static  postData(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Map<String, dynamic> data}) async {
    return await dio!.post(url, data: data, queryParameters: queryParameters).then((value){print("success value is : $value");}).catchError((e){print(e.toString());});
  }
}
