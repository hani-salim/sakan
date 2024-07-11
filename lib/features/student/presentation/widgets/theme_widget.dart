import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:sakan/features/student/presentation/bloc/local/presentation_bloc.dart';
import '../../domain/entities/theme_entities.dart';

class ThemeWidget extends StatelessWidget {
  final String primaryColor;
  final String secondaryColor;
  final ThemeEntities item;
  const ThemeWidget(
      {super.key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PresentationBloc, PresentationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<PresentationBloc>().add(ChangeTheme(item: item));
          },
          child: Container(
              height: 100,
              decoration: BoxDecoration(
                  border: item.isTapped
                      ? Border.all(
                          color: Colors.green,
                          style: BorderStyle.solid,
                          width: 5)
                      : null,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(colors: [
                    HexColor(primaryColor),
                    HexColor(secondaryColor)
                  ])),
              child: item.isTapped
                  ? Lottie.asset('assets/lottieFiles/theme.json')
                  : null),
        );
      },
    );
  }
}
