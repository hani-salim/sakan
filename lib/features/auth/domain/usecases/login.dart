
import '../repository/user_repository.dart';


class LoginUseCase
{
final UserRepository  _userRepository;
LoginUseCase(this._userRepository);
  call({required String email, required String password})
   {
    return _userRepository.login(email: email, password: password);
   }
}