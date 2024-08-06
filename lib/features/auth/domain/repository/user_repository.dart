import '../entities/user.dart';

abstract class UserRepository {
  login(
      {required String email, required String password});
  register({required UserEntities userEntities});
  logout({required String refreshToken});
}
