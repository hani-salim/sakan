part of 'presentation_bloc.dart';

sealed class PresentationEvent extends Equatable {
  const PresentationEvent();

  @override
  List<Object> get props => [];
}
class ChangeDrwerItem extends PresentationEvent {
  final MenuEntities item;
  const ChangeDrwerItem({required this.item});
}

class ChangeBottomNavicaitonBar extends PresentationEvent {
  final int selectedPage;
  const ChangeBottomNavicaitonBar({required this.selectedPage});
}

class ChangeTheme extends PresentationEvent {
  final ThemeEntities item;
  const ChangeTheme({required this.item});
}
