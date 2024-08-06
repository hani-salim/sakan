import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/student/domain/useCases/submit_bread_order.dart';
import '../../../../../../core/resource/dart_state.dart';
import '../../../../domain/entities/room_entities.dart';
import '../../../../domain/useCases/get_rooms.dart';
import '../../../../domain/useCases/get_unities.dart';
import '../../../../domain/useCases/get_universities.dart';
import 'student_state.dart';

part 'student_event.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final GetUniversitiesUseCase _getUniversitiesUseCase;
  final GetUnitiesUseCase _getUnitiesUseCase;
  final GetRoomsUseCase _getRoomsUseCase;
  final SubmitABreadOrderUseCase _submitABreadOrderUseCase;

  //lists
  var universities = [];
  var unities = [];
  var rooms = [];
//controllers
  String? universityName;
  String? unitName;
  String? registerType;

  //attachments
  XFile? attachedRepaire;
  XFile? attachedPermit;
  XFile? attachedfrontId;
  XFile? attachedBackId;
  XFile? attachedface;

  bool isFloatingActionbuttonShow = true;
  bool isShowBottomSheet = false;
  Icon bottomSheetIcon = const Icon(
    Icons.add,
    color: Colors.white,
  );

  StudentBloc(this._getUniversitiesUseCase, this._getUnitiesUseCase,
      this._getRoomsUseCase, this._submitABreadOrderUseCase)
      : super(StudentInitial()) {
    on<ChooseAttach>(onChooseAttach);
    on<SubmitABreadOrder>(onSubmitAbreadOrder);
    on<ChangeBottomSheet>(onChangeBottomSheet);
    on<SelectRoom>(onSelectRoom);
    on<GetUniversities>(onGetUniversities);
    on<GetUnities>(onGetUnities);
    on<GetRooms>(onGetRooms);
    on<SelectRegisterType>(onSelectRegisterType);
  }

  onChooseAttach(ChooseAttach event, Emitter<StudentState> emit) async {
    emit(StudentInitial());
    ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      switch (event.attach) {
        case 'repaireRequest':
          attachedRepaire = XFile(value!.path);
          emit(ChooseAttachSuccess(attach: attachedRepaire));
          break;
        case 'workPermit':
          attachedPermit = XFile(value!.path);
          emit(ChooseAttachSuccess(attach: attachedPermit));
          break;
        case 'frontId':
          attachedfrontId = XFile(value!.path);
          emit(ChooseAttachSuccess(attach: attachedfrontId));
          break;
        case 'backId':
          attachedBackId = XFile(value!.path);
          emit(ChooseAttachSuccess(attach: attachedBackId));
          break;
        case 'face':
          attachedface = XFile(value!.path);
          emit(ChooseAttachSuccess(attach: attachedface));
          break;
      }
    }).catchError((e) {
      emit(ChooseAttachError(exception: e));
    });
  }

  onSubmitAbreadOrder(SubmitABreadOrder event, Emitter<StudentState> emit) {
    emit(SubmitABreadOrderLoadingState());
    final dataState = _submitABreadOrderUseCase(
        breadTies: event.breadTies, phone: event.phone);
    if (dataState is DataSuccess) {
          isFloatingActionbuttonShow = false;

      emit(SubmitABreadOrderSuccessState(breadOrderEntities: dataState.data));
    } else if (dataState is DataFailed) {
      emit(SubmitABreadOrderErrorState(exception: dataState.error));
    } else {
      emit(SubmitABreadOrderErrorState(exception: dataState));
    }
  }

  onChangeBottomSheet(ChangeBottomSheet event, Emitter<StudentState> emit) {
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
    }
  }

  onSelectRoom(SelectRoom event, Emitter<StudentState> emit) {
    emit(StudentInitial());
    emit(SelectRoomState(roomEntities: event.roomEntities));
  }

  //Get Universities
  onGetUniversities(GetUniversities event, Emitter<StudentState> emit) async {
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
  onGetUnities(GetUnities event, Emitter<StudentState> emit) async {
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
  onGetRooms(GetRooms event, Emitter<StudentState> emit) async {
    emit(GetRoomsLoadingState());
    final dataState =
        await _getRoomsUseCase(university: event.university, unit: event.unit);
    if (dataState is DataSuccess) {
      rooms = dataState.data;
      emit(GetRoomsSuccessState(data: dataState.data));
    } else {
      emit(GetRoomsErrorState(exception: dataState));
    }
  }

  //Select Register type
  onSelectRegisterType(SelectRegisterType event, Emitter<StudentState> emit) {
    emit((StudentInitial()));

    emit(SelectRegisterTypeState(registerType: event.registerType));
  }
}
