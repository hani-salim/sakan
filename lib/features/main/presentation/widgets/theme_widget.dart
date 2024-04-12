import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sakan/features/main/domain/entities/theme_item.dart';
import 'package:sakan/features/main/presentation/bloc/widget_bloc.dart';

class ThemeWidget extends StatelessWidget {
  final HexColor primaryColor;
  final HexColor secondaryColor;
  final ThemeEntities item;
  const ThemeWidget(
      {super.key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WidgetBloc, WidgetState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<WidgetBloc>().add(ChangeTheme(item: item));
          },
          child: Container(
              height: 100,
              decoration: BoxDecoration(
                  border: item.isTapped
                      ? Border.all(
                          color: Colors.green, style: BorderStyle.solid)
                      : null,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  gradient:
                      LinearGradient(colors: [primaryColor, secondaryColor])),
              child: item.isTapped
                  ? const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 40,
                    )
                  : null),
        );
      },
    );
  }
}
