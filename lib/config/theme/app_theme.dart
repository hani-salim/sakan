import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

ThemeData get appTheme {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: MyColors.primaryColor,
    secondaryHeaderColor: MyColors.secondaryColor,
    appBarTheme: _appBarTheme,
    textTheme: _textTheme,
    iconTheme: _iconTheme,
  );
}

AppBarTheme get _appBarTheme {
  return AppBarTheme(
    iconTheme: _iconTheme,
  );
}

IconThemeData get _iconTheme {
  return const IconThemeData(
    color: Colors.white,
    size: 20,
  );
}

TextTheme get _textTheme {
  return const TextTheme(
    headlineLarge: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 15.0, color: Colors.grey),
    labelLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),
  );
}
