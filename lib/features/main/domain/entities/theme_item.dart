import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ThemeEntities extends Equatable {
  final String primaryColor;
  final String secondaryColor;
bool isTapped;
   ThemeEntities(
      {required this.primaryColor, required this.secondaryColor,this.isTapped=false});

  @override
  List<Object?> get props => [primaryColor, secondaryColor];
}
