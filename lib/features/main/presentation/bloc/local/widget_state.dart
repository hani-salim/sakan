part of 'widget_bloc.dart';

sealed class WidgetState extends Equatable {
  const WidgetState();

  @override
  List<Object> get props => [];
}

final class WidgetInitialState extends WidgetState {}

final class ChangeBottomNavicaitonBarState extends WidgetState {}

final class ChangeThemeState extends WidgetState {}

final class ChangeBottomSheetState extends WidgetState {}

final class AddBreadRequesetLoadingState extends WidgetState {}

final class AddBreadRequesetSuccessState extends WidgetState {}

final class AddBreadRequesetErrorState extends WidgetState {}
