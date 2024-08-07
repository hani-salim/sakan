import 'dart:convert';

import '../../../../core/constant/constant.dart';
import '../../../../core/network/local/local_storage.dart';
import '../models/user.dart';

import '../../../../core/resource/dart_state.dart';
import '../data_sources/remote/user_api_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  register({required UserEntities userEntities}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  login({required String email, required String password}) async {
    final response =
        await _userApiService.login(email: email, password: password);
    if (response is DataSuccess &&
        response.data.isNotEmpty &&
        response.data['message'] == null) {
      user = UserModel.fromJson(response.data);
      await LocalStorage.putData(key: 'user', value: jsonEncode(response.data));
      return DataSuccess(UserModel.fromJson(response.data));
    } else if (response is DataFailed) {
      return response;
    } else {
      return 'كلمة المرور المدخلة أو الإيميل غير صحيحين';
    }
  }
  
  @override
  logout({required String refreshToken}) async{
    final response = await _userApiService.logout(refreshToken: refreshToken);
    if(response is DataSuccess){
      return DataSuccess('تم تسجيل الخروج بنجاح');
    }else{
      return 'حدث خطأ أثناء تسجيل الخروج';
    }
  }
}
