import 'package:sakan/core/resource/dart_state.dart';
import 'package:sakan/features/auth/domain/entities/user.dart';
import 'package:sakan/features/auth/domain/repository/user_repository.dart';

class RegisterUseCase {
  final UserRepository _userRepository;
  RegisterUseCase(this._userRepository);
  Future<DataState> call({required UserEntities userEntities})async{
    return await _userRepository.register(userEntities: userEntities);
  }
}