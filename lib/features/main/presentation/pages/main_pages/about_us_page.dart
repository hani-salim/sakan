import 'package:flutter/material.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/appbar.dart';
import 'package:sakan/features/main/presentation/widgets/menu_widget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          text: titles[7], context: context, leading: const MenuWidget()),
      body: const Center(
        child: Icon(
          Icons.question_mark,
          color: Colors.black,
          size: 200,
        ),
      ),
    );
  }
}
