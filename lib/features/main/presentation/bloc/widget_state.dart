part of 'widget_bloc.dart';

sealed class WidgetState extends Equatable {
  const WidgetState();

  @override
  List<Object> get props => [];
}

final class WidgetInitial extends WidgetState {}

final class ChangeSelectedItem extends WidgetState {}
