import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SimpleLoadingWidget extends StatelessWidget {
  const SimpleLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
           'assets/lottieFiles/loading_image.json'),
    );
  }
}