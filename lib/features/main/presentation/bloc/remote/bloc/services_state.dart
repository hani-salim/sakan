

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

sealed class ServicesState extends Equatable {
  const ServicesState();
  
  @override
  List<Object> get props => [];
}

final class ServicesInitial extends ServicesState {}
 
 class ChooseAttachSuccess extends ServicesState{
  final XFile? attach;
  const ChooseAttachSuccess({required this.attach});
 }

 class ChooseAttachError extends ServicesState{
  final String e;
  const ChooseAttachError({required this.e});
 }
 final class AddBreadRequesetLoadingState extends ServicesState {}

final class AddBreadRequesetSuccessState extends ServicesState {}

final class AddBreadRequesetErrorState extends ServicesState {}

final class ChangeBottomSheetState extends ServicesState {}

