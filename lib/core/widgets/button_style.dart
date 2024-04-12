import 'package:flutter/material.dart';

ButtonStyle buttonStyleWidget() {
  return ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
    minimumSize: MaterialStateProperty.all(const Size(50, 50)),
    backgroundColor:
        MaterialStateProperty.all(const Color.fromARGB(0, 255, 4, 4)),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );
}
