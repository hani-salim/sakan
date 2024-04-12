import 'package:equatable/equatable.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class ThemeEntities extends Equatable {
  final HexColor primaryColor;
  final HexColor secondaryColor;
bool isTapped;
   ThemeEntities(
      {required this.primaryColor, required this.secondaryColor,this.isTapped=false});

  @override
  List<Object?> get props => [primaryColor, secondaryColor];
}
