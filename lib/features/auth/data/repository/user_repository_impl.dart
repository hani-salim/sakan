
import 'dart:convert';

import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/network/local/local_storage.dart';
import 'package:sakan/features/auth/data/models/user.dart';

import '../../../../core/resource/dart_state.dart';
import '../data_sources/remote/user_api_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService userApiService;

  UserRepositoryImpl(this.userApiService);

  @override
  register({required UserEntities userEntities}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  getRoomsNumber({required String unitNumber, required String univercityName}) {
    // TODO: implement getRoomsNumber
    throw UnimplementedError();
  }

  @override
  getUnits({required String univercityName}) {
    throw UnimplementedError();
  }

  @override
  getUnivercities() {
    // TODO: implement getUnivercities
    throw UnimplementedError();
  }

  @override
  login({required String email, required String password}) async {
    final response =
        await userApiService.login(email: email, password: password);
    if (response is DataSuccess && response.data.isNotEmpty && response.data['message'] == null) {
      user =  UserModel.fromJson(response.data);
      await LocalStorage.putData(key: 'user',value: jsonEncode(response.data));
      return DataSuccess(UserModel.fromJson(response.data));
    } else if(response is DataFailed){
      return response;
    }else{
      return 'كلمة المرور المدخلة أو الإيميل غير صحيحين';
    }
  }
}
