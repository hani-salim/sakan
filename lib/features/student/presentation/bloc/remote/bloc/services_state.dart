import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/student/domain/entities/room_entities.dart';

sealed class ServicesState<T> extends Equatable {
  final DioException? exception;
  final T? data;
  const ServicesState({this.exception, this.data});

  @override
  List<Object> get props => [];
}

//initial
final class ServicesInitial extends ServicesState {}

//choose attachment
class ChooseAttachSuccess extends ServicesState {
  final XFile? attach;
  const ChooseAttachSuccess({required this.attach});
}

class ChooseAttachError extends ServicesState {
  const ChooseAttachError({required super.exception});
}

//add bread request
final class AddBreadRequesetLoadingState extends ServicesState {}

final class AddBreadRequesetSuccessState extends ServicesState {}

final class AddBreadRequesetErrorState extends ServicesState {
  const AddBreadRequesetErrorState({required super.exception});
}

//change bottom sheet
final class ChangeBottomSheetState extends ServicesState {}

//choose room
final class ChooseroomSuccessState extends ServicesState {}

final class ChooseroomErrorState extends ServicesState {
  const ChooseroomErrorState({required super.exception});
}

final class ChooseroomLoadingState extends ServicesState {}

//select room
final class SelectRoomState extends ServicesState {
  final RoomEntities roomEntities;
  const SelectRoomState({required this.roomEntities});
}

//get universities
final class GetUniversitiesSuccessState extends ServicesState {
  const GetUniversitiesSuccessState({required super.data});
}

final class GetUniversitiesErrorState extends ServicesState {
  const GetUniversitiesErrorState({required super.exception});
}

final class GetUniversitiesLoadingState extends ServicesState {}

//get unities
final class GetUnitiesSuccessState extends ServicesState {
  const GetUnitiesSuccessState({required super.data});
}

final class GetUnitiesErrorState extends ServicesState {
  const GetUnitiesErrorState({required super.exception});
}

final class GetUnitiesLoadingState extends ServicesState {}

//get rooms
final class GetRoomsSuccessState extends ServicesState {
  const GetRoomsSuccessState({required super.data});
}

final class GetRoomsErrorState extends ServicesState {
  const GetRoomsErrorState({required super.exception});
}

final class GetRoomsLoadingState extends ServicesState {}
