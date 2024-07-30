import 'package:flutter/material.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/appbar.dart';
import '../../widgets/menu_widget.dart';

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
