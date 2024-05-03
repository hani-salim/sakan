import 'package:flutter/material.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/appbar.dart';
import 'package:sakan/features/main/presentation/widgets/menu_widget.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          text: titles[6], context: context, leading: const MenuWidget()),
      body: const Center(
        child: Icon(
          Icons.help,
          color: Colors.black,
          size: 200,
        ),
      ),
    );
  }
}
