import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../network/local/local_storage.dart';

class MyColors {
  static Color primaryColor =
      HexColor(LocalStorage.getData(key: 'primaryColor') ?? "#000428");

  static Color secondaryColor =
      HexColor(LocalStorage.getData(key: 'secondaryColor') ?? "#004e92");
  static Color drawerColor = Colors.indigo;
  //static Color drawerShadowsBackgroundColor = primaryColor;
  static Color white = Colors.white;
  static Color black = Colors.black;
}
