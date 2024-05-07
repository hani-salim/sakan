import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: MyColors.drawerColor,));
  }
}