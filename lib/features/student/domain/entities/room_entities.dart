import 'package:flutter/material.dart';

class RoomEntities {
  final String roomNumber;
  String? status;
  MaterialColor? color;
  int studentsNumber;

  RoomEntities({required this.roomNumber,  this.status,required this.studentsNumber}) {
   if(studentsNumber >= 6){
    status='ممتلئة';
    color = Colors.red;
   }else if(studentsNumber == 0){
    status='فارغة';
     color = Colors.grey;
   }else{
    status='متاحة';
    color = Colors.green;
   }
  }
}
