import '../entities/user.dart';

abstract class UserRepository {
  login(
      {required String email, required String password});
  register({required UserEntities userEntities});
  getUnivercities();
  getUnits({required String univercityName});
  getRoomsNumber({required String unitNumber,required String univercityName});
}
