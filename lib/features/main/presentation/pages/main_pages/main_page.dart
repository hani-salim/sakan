import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/main/presentation/bloc/widget_bloc.dart';
import 'package:sakan/features/main/presentation/widgets/convex_app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  build(BuildContext context) {
    return BlocConsumer<WidgetBloc, WidgetState>(
      listener: (context, state) {},
      builder: (context, state) {
        int selectedPage = BlocProvider.of<WidgetBloc>(context).selectedPage;
        return Scaffold(
          body: pages[selectedPage],
          bottomNavigationBar: ConvexAppBarWidget(
            selectedPage: selectedPage,
            tapItems: _tapItems,
          ),
        );
      },
    );
  }
}

List<TabItem> _tapItems = const [
  TabItem(
    icon: Icons.person,
    title: "الملف",
  ),
  TabItem(icon: Icons.history, title: "السجل"),
  TabItem(icon: Icons.house, title: "الرئيسية"),
  TabItem(icon: Icons.newspaper, title: "الأخبار"),
  TabItem(icon: Icons.settings, title: "الإعدادات"),
];
