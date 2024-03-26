import 'package:flutter/material.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/widgets.dart';
import 'package:sakan/features/main/presentation/widgets/menu_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          text: titles[5], context: context, leading: const MenuWidget()),
      body: const Center(
        child: Icon(
          Icons.notifications,
          color: Colors.black,
          size: 200,
        ),
      ),
    );
  }
}
