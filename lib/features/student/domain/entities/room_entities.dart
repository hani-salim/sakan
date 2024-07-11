import 'package:flutter/material.dart';

class RoomEntities {
  final String roomNumber;
  String status;
  MaterialColor? color;
  int studentsNumber;

  RoomEntities({required this.roomNumber, required this.status,required this.studentsNumber}) {
    switch (status) {
      case 'متاحة':
        color = Colors.green;
        break;
      case 'خاصة':
        color = Colors.pink;
        break;
      case 'ممتلئة':
        color = Colors.red;
        break;
      case 'فارغة':
        color = Colors.grey;
        break;
      default:
    }
  }
}
