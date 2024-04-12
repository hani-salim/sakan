import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';

InputDecoration textInputDecorationWidget(
    {String labelText = "",
    String hintText = "",
    bool showPassword = true,
    bool obSecure = false,
    IconButton? suffixIcon}) {
  return InputDecoration(
    suffixIcon: obSecure ? suffixIcon : null,
    labelText: labelText,
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: BorderSide(color: MyColors.primaryColor)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: BorderSide(color: Colors.grey.shade400)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0)),
  );
}
