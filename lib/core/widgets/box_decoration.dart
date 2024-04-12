import 'package:flutter/material.dart';

BoxDecoration inputBoxDecorationShaddowWidget() {
  return BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 20,
      offset: const Offset(0, 5),
    )
  ]);
}
