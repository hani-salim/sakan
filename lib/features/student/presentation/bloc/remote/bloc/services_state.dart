import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/student/domain/entities/room_entities.dart';

sealed class ServicesState extends Equatable {
  final DioException? exception;
  const ServicesState({this.exception});

  @override
  List<Object> get props => [];
}

final class ServicesInitial extends ServicesState {}

class ChooseAttachSuccess extends ServicesState {
  final XFile? attach;
  const ChooseAttachSuccess({required this.attach});
}

class ChooseAttachError extends ServicesState {
  const ChooseAttachError({required super.exception});
}

final class AddBreadRequesetLoadingState extends ServicesState {}

final class AddBreadRequesetSuccessState extends ServicesState {}

final class AddBreadRequesetErrorState extends ServicesState {
  const AddBreadRequesetErrorState({required super.exception});
}

final class ChangeBottomSheetState extends ServicesState {}

final class ChooseroomSuccessState extends ServicesState {}

final class ChooseroomErrorState extends ServicesState {
  const ChooseroomErrorState({required super.exception});
}

final class ChooseroomLoadingState extends ServicesState {}

final class SelectRoomState extends ServicesState {
  final RoomEntities roomEntities;
  const SelectRoomState({required this.roomEntities});
}

