import 'package:flutter/material.dart';
import '../colors/colors.dart';

BoxDecoration buttonBoxDecorationWidget(
    { Color? color1, Color? color2}) {
  Color c1 = MyColors.primaryColor;
  Color c2 = MyColors.secondaryColor;
  if (color1 != null) {
    c1 = color1;
  }
  if (color2 != null) {
    c2 = color2;
  }

  return BoxDecoration(
    boxShadow: const [
      BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.0, 1.0],
      colors: [
        c1,
        c2,
      ],
    ),
    color: Colors.deepPurple.shade300,
    borderRadius: BorderRadius.circular(30),
  );
}
