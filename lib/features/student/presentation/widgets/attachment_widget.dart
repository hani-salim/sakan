import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/student_bloc.dart';

class AttachmentWidget extends StatelessWidget {
  final String text;
  final StudentEvent event;

  const AttachmentWidget({super.key, required this.text,required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<StudentBloc>().add(event);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.secondaryColor,
                width: 2.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(15.0),
              shape: BoxShape.rectangle,
            ),
            child:  Icon(Icons.attach_file,color: MyColors.secondaryColor,)
            ),
            
            Center(
              child: Text(
                text,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
          ),
        ],
      ),
    );
  }
}
