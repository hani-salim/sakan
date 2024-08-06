
import '../repository/user_repository.dart';


class LogoutUseCase
{
final UserRepository  _userRepository;
LogoutUseCase(this._userRepository);
  call({required String refreshToken})
   {
    return _userRepository.logout(refreshToken: refreshToken);
   }
}