import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/student/domain/entities/bread_order.dart';
import '../../../../domain/entities/room_entities.dart';

sealed class StudentState<T> extends Equatable {
  final T? exception;
  final T? data;
  const StudentState({this.exception, this.data});

  @override
  List<Object> get props => [];
}

//initial
final class StudentInitial extends StudentState {}

//choose attachment
class ChooseAttachSuccess extends StudentState {
  final XFile? attach;
  const ChooseAttachSuccess({required this.attach});
}

class ChooseAttachError extends StudentState {
  const ChooseAttachError({required super.exception});
}


//change bottom sheet
final class ChangeBottomSheetState extends StudentState {}

//choose room
final class ChooseroomSuccessState extends StudentState {}

final class ChooseroomErrorState extends StudentState {
  const ChooseroomErrorState({required super.exception});
}

final class ChooseroomLoadingState extends StudentState {}

//select room
final class SelectRoomState extends StudentState {
  final RoomEntities roomEntities;
  const SelectRoomState({required this.roomEntities});
}

//get universities
final class GetUniversitiesSuccessState extends StudentState {
  const GetUniversitiesSuccessState({required super.data});
}

final class GetUniversitiesErrorState extends StudentState {
   GetUniversitiesErrorState({required super.exception}){
    print(exception.toString());
  }
}
final class GetUniversitiesLoadingState extends StudentState {}

//get unities
final class GetUnitiesSuccessState extends StudentState {
  const GetUnitiesSuccessState({required super.data});
}

final class GetUnitiesErrorState extends StudentState {
  const GetUnitiesErrorState({required super.exception});
}

final class GetUnitiesLoadingState extends StudentState {}

//get rooms
final class GetRoomsSuccessState extends StudentState {
  const GetRoomsSuccessState({required super.data});
}

final class GetRoomsErrorState extends StudentState {
  const GetRoomsErrorState({required super.exception});
}

final class GetRoomsLoadingState extends StudentState {}

//select register type
final class SelectRegisterTypeState extends StudentState {
  final String registerType;
  const SelectRegisterTypeState({required this.registerType});
}

//submit a bread order
final class SubmitABreadOrderSuccessState extends StudentState {
  final BreadOrderEntities breadOrderEntities;
  const SubmitABreadOrderSuccessState( {required this.breadOrderEntities,});
}

final class SubmitABreadOrderErrorState extends StudentState {
  const SubmitABreadOrderErrorState({required super.exception});
}

final class SubmitABreadOrderLoadingState extends StudentState {}
