import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sakan/features/student/data/repository/student_repository_impl.dart';
import '../../../../../core/network/remote/dio_helper.dart';
import '../../../../../core/resource/dart_state.dart';
import '../../models/user.dart';

abstract class UserApiService {
  login({required String email, required String password});
   register({required UserModel userModel});
   logout({required String refreshToken});
}

class UserApiServiceWitDio implements UserApiService {
  @override
  login({required String email, required String password}) async {
    var data = json.encode({"email": email, "password": password});
   
      final response =
          await DioHelper.request(url: 'login/', method: 'POST', data: data);
      return chekResponse(response: response);
    
  }


  @override
  DataState register({required UserModel userModel}) {
    throw UnimplementedError();
  }
  
  @override
  logout({required String refreshToken})async {
    final response = await DioHelper.request(url: 'logout/', method: 'post');
    return checkResponse(response: response);
  }
}

 DataState chekResponse({required  response, int statusCode = 200}) {
  if (response.statusCode == statusCode) {
    print('-----------------succsess-----------------------');
    print(response.data);
    return DataSuccess(response.data);
  } else {   
    print('-------------------failed-----------------------'); 
    return DataFailed(DioException(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions));
  }
}
