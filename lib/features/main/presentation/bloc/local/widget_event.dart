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

class ChangeTheme extends WidgetEvent {
  final ThemeEntities item;
  const ChangeTheme({required this.item});
}

class ChangeBottomSheet extends WidgetEvent{
  final bool isShow;
  const ChangeBottomSheet({required this.isShow}); 
}

class AddBreadRequeset extends WidgetEvent{
  final String date;
  final String time;
  final String numberOfBread;

  const AddBreadRequeset({required this.date, required this.time, required this.numberOfBread});
}