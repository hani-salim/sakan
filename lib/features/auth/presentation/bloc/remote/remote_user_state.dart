import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:sakan/features/auth/domain/entities/user.dart';

abstract class RemoteUserState extends Equatable {
  final UserEntities? userEntities;

  final DioException? exception;
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
  const RemoteUserErrorState(DioException exception)
      : super(exception: exception);
}

class RemoteChangeJob extends RemoteUserState{}
