import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../core/constant/constant.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          print(context);
          ZoomDrawer.of(context)!.toggle();
        },
        icon: const Icon(
          Icons.list,
          color: Colors.white,
          size: iconAppBarSize,
        ));
  }
}
