import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/auth/domain/usecases/logout.dart';

import '../../../../../core/resource/dart_state.dart';
import '../../../domain/usecases/login.dart';
import '../../../domain/usecases/register.dart';
import 'remote_user_event.dart';
import 'remote_user_state.dart';

class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUserState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;

  RemoteUserBloc(this._loginUseCase, this._registerUseCase, this._logoutUseCase)
      : super(RemoteUserInitilalState()) {
    on<Login>(onLogin);
    on<Register>(onRegister);
    on<ChooseProfielImage>(onChooseProfileImage);
    on<Logout>(onLogout);
  }
  onChooseProfileImage( ChooseProfielImage event, Emitter<RemoteUserState> emit)async{
  emit(RemoteUserInitilalState());
  ImagePicker picker=ImagePicker();
   await picker.pickImage(source: ImageSource.gallery).then((value) {
   
        emit(ChooseProfielImageSuccess(profileImage: XFile(value!.path)));
  }).catchError((e){
    emit(ChooseProfileImageError(e: e.toString()));
  });  
}

  void onLogin(Login event, Emitter<RemoteUserState> emit) async {
    emit(RemoteUserLoadingState());
   
 final dataState =await _loginUseCase(email: event.email, password: event.password);
    if (dataState is DataSuccess) { 
      emit(RemoteUserSuccessState(dataState.data));
    }
    else if (dataState is DataFailed) {
      emit(RemoteUserErrorState(dataState.error!));
    }else {
      emit(RemoteUserErrorState(dataState));
    }
   
      
  }
void onLogout(Logout event,Emitter<RemoteUserState> emit)async{
  emit(RemoteUserLoadingState());
  final dataState = await _logoutUseCase(refreshToken: event.refreshToken);
  if(dataState is DataSuccess){
    emit(RemoteUserLogoutSuccess(message: dataState.data));
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
