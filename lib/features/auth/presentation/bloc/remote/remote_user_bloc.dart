import 'package:sakan/core/resource/dart_state.dart';
import 'package:sakan/features/auth/domain/usecases/login.dart';
import 'package:sakan/features/auth/domain/usecases/register.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_event.dart';
import 'package:bloc/bloc.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_state.dart';

class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUserState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  RemoteUserBloc(this._loginUseCase, this._registerUseCase)
      : super(RemoteUserInitilalState()) {
    on<Login>(onLogin);
    on<Register>(onRegister);

  }

  void onLogin(Login event, Emitter<RemoteUserState> emit) async {
    emit(RemoteUserLoadingState());
    DataState dataState =
        await _loginUseCase(number: event.number, password: event.password);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteUserSuccessState(dataState.data));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserErrorState(dataState.error!));
    }
  }

  void onRegister(Register event, Emitter<RemoteUserState> emit) async {
    DataState dataState =
        await _registerUseCase(userEntities: event.userEntities);
    if (dataState is DataSuccess) {
      emit(RemoteUserSuccessState(dataState.data));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserErrorState(dataState.error!));
    }
  }
}
