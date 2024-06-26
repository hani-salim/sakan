import '../../../../core/resource/dart_state.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntities>> login(
      {required String number, required String password});
  register({required UserEntities userEntities});
  getUnivercities();
  getUnits({required String univercityName});
  getRoomsNumber({required String unitNumber,required String univercityName});
}
