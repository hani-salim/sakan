import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/button_box_decoration.dart';
import '../../domain/entities/room_entities.dart';
import '../bloc/remote/bloc/student_bloc.dart';

// ignore: must_be_immutable
class RoomWidget extends StatelessWidget {
  RoomEntities roomItem;
   RoomWidget({super.key,required this.roomItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<StudentBloc>().add(SelectRoom(roomEntities: roomItem)),
      child: Container(
        
        decoration: buttonBoxDecorationWidget(color1: roomItem.color,color2: roomItem.color?.shade300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(roomItem.status!,style: const TextStyle(color: Colors.black87,fontSize: 14,fontWeight: FontWeight.normal),),
          Text(roomItem.roomNumber,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
          Text(roomItem.studentsNumber.toString(),style: const TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w100),),
         
        ],),
      ),
    );
  }
}