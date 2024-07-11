import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/entities/user.dart';

abstract class RemoteUserState extends Equatable {
  final UserEntities? userEntities;

  // ignore: prefer_typing_uninitialized_variables
  final  exception;
  const RemoteUserState({this.userEntities, this.exception});

  @override
  List<Object?> get props => [userEntities, exception];
}

class RemoteUserInitilalState extends RemoteUserState {}

class RemoteUserLoadingState extends RemoteUserState {}

class RemoteUserSuccessState extends RemoteUserState {
  const RemoteUserSuccessState(UserEntities userEntities)
      : super(userEntities: userEntities);
}

class RemoteUserErrorState extends RemoteUserState {
  const RemoteUserErrorState(exception)
      : super(exception: exception);
}

 class ChooseProfielImageSuccess extends RemoteUserState{
  final XFile? profileImage;
  const ChooseProfielImageSuccess({required this.profileImage});
 }

 class ChooseProfileImageError extends RemoteUserState{
  final String e;
  const ChooseProfileImageError({required this.e});
 }