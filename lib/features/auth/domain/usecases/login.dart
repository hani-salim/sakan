import '../../../../core/resource/dart_state.dart';
import '../entities/user.dart';
import '../repository/user_repository.dart';


class LoginUseCase
{
final UserRepository  _userRepository;
LoginUseCase(this._userRepository);
   Future<DataState<UserEntities>> call({required String number, required String password})
   {
    return _userRepository.login(number: number, password: password);
   }
}