import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../colors/colors.dart';

BoxDecoration cardDecoration({
  HexColor? primaryColor,
  HexColor? secondaryColor
}) {
  return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: MyColors.primaryColor.withOpacity(0.4),
            offset: const Offset(-5, 5)),
      ],
      gradient: primaryColor!=null && secondaryColor!=null ?LinearGradient(colors: [
        primaryColor,secondaryColor
      ]):null);
}
