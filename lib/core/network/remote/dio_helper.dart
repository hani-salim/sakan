import 'package:dio/dio.dart';

import '../../constant/constant.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio();
  }

  static var headers = {'Content-Type': 'application/json'};
  static request({required String url, 
    String? data,
    required String method
  }) async {
    
      return await dio?.request(baseUrl + url,
        data: data, options: Options(headers: headers, method: method)).catchError((e){
          print('exception from data server :');
      print(e.toString());
      throw UnimplementedError();
        });
    
    
  }
}
