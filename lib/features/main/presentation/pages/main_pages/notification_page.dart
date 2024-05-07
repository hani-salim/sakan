import 'package:flutter/material.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/appbar.dart';
import '../../widgets/menu_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
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
