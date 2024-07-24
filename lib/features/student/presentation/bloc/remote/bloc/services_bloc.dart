import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/core/resource/dart_state.dart';
import 'package:sakan/features/student/domain/entities/room_entities.dart';
import 'package:sakan/features/student/domain/useCases/get_rooms.dart';
import 'package:sakan/features/student/domain/useCases/get_unities.dart';
import 'package:sakan/features/student/domain/useCases/get_universities.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/services_state.dart';

part 'services_event.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final GetUniversitiesUseCase _getUniversitiesUseCase;
  final GetUnitiesUseCase _getUnitiesUseCase;
  final GetRoomsUseCase _getRoomsUseCase;
  var universities = [];
  var unities = [];
  var rooms = [];
  bool isFloatingActionbuttonShow = true;
  bool isShowBottomSheet = false;
  Icon bottomSheetIcon = const Icon(
    Icons.add,
    color: Colors.white,
  );

  ServicesBloc(this._getUniversitiesUseCase, this._getUnitiesUseCase,
      this._getRoomsUseCase)
      : super(ServicesInitial()) {
    on<ChooseAttach>(onChooseAttach);
    on<AddBreadRequeset>(onAddBreadRequest);
    on<ChangeBottomSheet>(onChangeBottomSheet);
    on<SelectRoom>(onSelectRoom);
    on<GetUniversities>(onGetUniversities);
    on<GetUnities>(onGetUnities);
  }
  onChooseAttach(ChooseAttach event, Emitter<ServicesState> emit) async {
    emit(ServicesInitial());
    ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      emit(ChooseAttachSuccess(attach: XFile(value!.path)));
    }).catchError((e) {
      emit(ChooseAttachError(exception: e));
    });
  }

  onAddBreadRequest(AddBreadRequeset event, Emitter<ServicesState> emit) {
    emit(AddBreadRequesetLoadingState());
    isFloatingActionbuttonShow = false;
    emit(AddBreadRequesetSuccessState());
  }

  onChangeBottomSheet(ChangeBottomSheet event, Emitter<ServicesState> emit) {
    emit(ServicesInitial());

    if (event.isShow) {
      isShowBottomSheet = event.isShow;
      bottomSheetIcon = const Icon(
        Icons.edit,
        color: Colors.white,
      );
      emit(ChangeBottomSheetState());
    } else {
      isShowBottomSheet = event.isShow;
      bottomSheetIcon = const Icon(
        Icons.add,
        color: Colors.white,
      );
      emit(ChangeBottomSheetState());
    }
  }

  onSelectRoom(SelectRoom event, Emitter<ServicesState> emit) {
    emit(ServicesInitial());
    emit(SelectRoomState(roomEntities: event.roomEntities));
  }

  //Get Universities
  onGetUniversities(GetUniversities event, Emitter<ServicesState> emit) async {
    emit(GetUniversitiesLoadingState());
    final dataState = await _getUniversitiesUseCase();
    if (dataState is DataSuccess) {
      universities = dataState.data;
      emit(GetUniversitiesSuccessState(data: universities));
    } else {
      emit(GetUniversitiesErrorState(exception: dataState));
    }
  }

  //Get Unities
  onGetUnities(GetUnities event, Emitter<ServicesState> emit) async {
    emit(GetUnitiesLoadingState());
    final dataState = await _getUnitiesUseCase(university: event.university);
    if (dataState is DataSuccess) {
      unities = dataState.data;
      emit(GetUnitiesSuccessState(data: dataState.data));
    } else {
      emit(GetUnitiesErrorState(exception: dataState));
    }
  }
    //Get Rooms
  onGetRooms(GetRooms event, Emitter<ServicesState> emit) async {
    emit(GetRoomsLoadingState());
    final dataState = await _getRoomsUseCase(university: event.university,unit: event.unit);
    if (dataState is DataSuccess) {
      rooms = dataState.data;
      emit(GetRoomsSuccessState(data: dataState.data));
    } else {
      emit(GetRoomsErrorState(exception: dataState));
    }
  }
}
