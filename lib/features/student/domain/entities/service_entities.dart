import 'dart:ui';

import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class ServiceEntities extends Equatable {
  final Color color;
  final String title;
   bool isTapped ;
  final String url;
  final double height;
  ServiceEntities(
      {required this.color,
      required this.title,
      this.isTapped=false,
      required this.url,
      required this.height});

  @override
  List<Object?> get props => [color, title, isTapped, url];
}
