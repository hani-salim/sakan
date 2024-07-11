import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../../core/network/remote/dio_helper.dart';
import '../../../../../core/resource/dart_state.dart';
import '../../models/user.dart';

abstract class UserApiService {
  login({required String email, required String password});
  DataState register({required UserModel userModel});
  getUnivercities();
  getUnits({required String univercityName});
  getRoomsNumber({required String unitNumber, required String univercityName});
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
  getRoomsNumber({required String unitNumber, required String univercityName}) {
    // TODO: implement getRoomsNumber
    throw UnimplementedError();
  }

  @override
  getUnits({required String univercityName}) {
    // TODO: implement getUnits
    throw UnimplementedError();
  }

  @override
  getUnivercities() {
    // TODO: implement getUnivercities
    throw UnimplementedError();
  }

  @override
  DataState register({required UserModel userModel}) {
    // TODO: implement register
    throw UnimplementedError();
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
