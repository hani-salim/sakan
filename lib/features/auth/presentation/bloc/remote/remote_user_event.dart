import '../../../domain/entities/user.dart';

abstract class RemoteUserEvent {
  RemoteUserEvent();
}

class Login extends RemoteUserEvent {
  final String number;
  final String password;
  Login({required this.number, required this.password});
}

class Register extends RemoteUserEvent {
  final UserEntities userEntities;
  Register({required this.userEntities});
}


