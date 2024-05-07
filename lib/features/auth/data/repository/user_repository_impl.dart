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
  Future<DataState<UserEntities>> login({required String number, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
