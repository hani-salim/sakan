import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: LottieBuilder.asset('assets/lottieFiles/loading.json'));
  }
}

showLoadingWidget({required BuildContext context}){
  showDialog(context: context, builder: (context)=>
    Center(child: LottieBuilder.asset('assets/lottieFiles/loading.json')));
}