import 'package:flutter/material.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: titles[currentIndex], context: context),
      body: screens[currentIndex],
    );
  }
}
