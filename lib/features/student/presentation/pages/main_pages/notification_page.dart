import 'package:flutter/material.dart';
import 'package:sakan/features/student/presentation/widgets/empty_widget.dart';
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
      body: const EmptyWidget(title: 'لا يوجد إشعارات')
    );
  }
}
