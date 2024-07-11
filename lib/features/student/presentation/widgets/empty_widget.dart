import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/colors/colors.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  const EmptyWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Lottie.asset('assets/lottieFiles/empty.json'),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: MyColors.primaryColor),
          ),
                ],
              ),
        ));
  }
}
