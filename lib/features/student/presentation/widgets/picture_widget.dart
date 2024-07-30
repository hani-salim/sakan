

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/student_bloc.dart';

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    super.key,
    required this.attachedImage, required this.event,
  });

  final XFile? attachedImage;
  final StudentEvent event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<StudentBloc>().add(event);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 150,
          child: Image(
              image: FileImage(File(attachedImage!.path)),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
