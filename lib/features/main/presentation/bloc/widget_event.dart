// ignore_for_file: overridden_fields

part of 'widget_bloc.dart';

sealed class WidgetEvent extends Equatable {
  const WidgetEvent();

  @override
  List<Object> get props => [];
}

class ChangeDrwerItem extends WidgetEvent {
  final MenuItem item;
  const ChangeDrwerItem({required this.item});
}

class ChangeBottomNavicaitonBar extends WidgetEvent {
  final int selectedPage;
  const ChangeBottomNavicaitonBar({required this.selectedPage});
}
