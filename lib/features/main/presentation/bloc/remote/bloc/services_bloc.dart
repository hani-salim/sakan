

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/main/presentation/bloc/remote/bloc/services_state.dart';

part 'services_event.dart';


class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
    bool isFloatingActionbuttonShow=true;
      bool isShowBottomSheet = false;
  Icon bottomSheetIcon = const Icon(Icons.add,color: Colors.white,);

  ServicesBloc() : super(ServicesInitial()) {
    
    on<ChooseAttach>(onChooseAttach);
    on<AddBreadRequeset>(onAddBreadRequest);
        on<ChangeBottomSheet>(onChangeBottomSheet);

  }
 onChooseAttach( ChooseAttach event, Emitter<ServicesState> emit)async{
  emit(ServicesInitial());
  ImagePicker picker=ImagePicker();
   await picker.pickImage(source: ImageSource.gallery).then((value) {
   
        emit(ChooseAttachSuccess(attach: XFile(value!.path)));
  }).catchError((e){
    emit(ChooseAttachError(e: e.toString()));
  });  
}
 onAddBreadRequest(AddBreadRequeset event, Emitter<ServicesState> emit){
    emit(AddBreadRequesetLoadingState());
    isFloatingActionbuttonShow = false;
    emit(AddBreadRequesetSuccessState());
  }
  
  onChangeBottomSheet(ChangeBottomSheet event, Emitter<ServicesState> emit) {
    emit(ServicesInitial());
    
    if (event.isShow) {
      isShowBottomSheet = event.isShow;
      bottomSheetIcon = const Icon(Icons.edit,color: Colors.white,);
      emit(ChangeBottomSheetState());
    } else {
      isShowBottomSheet = event.isShow;
      bottomSheetIcon = const Icon(Icons.add,color: Colors.white,);
      emit(ChangeBottomSheetState());
    }
  }
}