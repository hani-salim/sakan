import 'package:flutter/material.dart';
import '../colors/colors.dart';

AppBar appBarWidget(
    {required text,
    required BuildContext context,
    List<Widget>? action,
    Widget? leading}) {
  //app bar
  return AppBar(
    title: Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    elevation: 0.0,
    iconTheme: const IconThemeData(color: Colors.white),
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            MyColors.primaryColor,
            MyColors.secondaryColor,
          ])),
    ),
    leading: leading,
    actions: action,
  );
}
