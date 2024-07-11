import 'package:image_picker/image_picker.dart';

import '../../../domain/entities/user.dart';

abstract class RemoteUserEvent {
  RemoteUserEvent();
}

class Login extends RemoteUserEvent {
  final String email;
  final String password;
  Login({required this.email, required this.password});
}

class Register extends RemoteUserEvent {
  final UserEntities userEntities;
  Register({required this.userEntities});
}

 class ChooseProfielImage extends RemoteUserEvent{
   XFile? profileImage;
  ChooseProfielImage({required this.profileImage});
 }

