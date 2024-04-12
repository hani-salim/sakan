part of 'widget_bloc.dart';

sealed class WidgetState extends Equatable {
  const WidgetState();

  @override
  List<Object> get props => [];
}

final class WidgetInitialState extends WidgetState {}

final class ChangeSelectedItemState extends WidgetState {}

final class ChangeThemeState extends WidgetState {}
