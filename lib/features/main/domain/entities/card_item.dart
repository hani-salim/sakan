import 'dart:ui';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CardEntities extends Equatable {
  final Color color;
  final String title;
  bool isTapped;
  final String url;
  final double height;
  CardEntities(
      {required this.color,
      required this.title,
      required this.isTapped,
      required this.url,
      required this.height});

  @override
  List<Object?> get props => [color, title, isTapped, url];
}
