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
showGeneralDialog(context: context, pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) { 
  return LottieBuilder.asset('assets/lottieFiles/loading.json');
 });
 
}

