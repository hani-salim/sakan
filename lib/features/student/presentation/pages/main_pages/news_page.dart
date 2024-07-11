import 'package:flutter/material.dart';
import 'package:sakan/features/student/presentation/widgets/empty_widget.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyWidget(title: 'لا يوجد  أخبار');
  }
}
