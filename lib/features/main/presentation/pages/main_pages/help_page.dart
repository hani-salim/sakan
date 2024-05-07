import 'package:flutter/material.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/appbar.dart';
import '../../widgets/menu_widget.dart';

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
