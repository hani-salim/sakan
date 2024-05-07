import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child: Icon(Icons.compass_calibration_outlined,size: 100,color: MyColors.primaryColor,),),);
  }
}