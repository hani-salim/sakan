import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/local/presentation_bloc.dart';
import '../../../../../core/constant/constant.dart';
import '../../widgets/convex_app_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static GlobalKey<ConvexAppBarState> appKey = GlobalKey<ConvexAppBarState>();

  @override
  build(BuildContext context) {
    int selectedPage = BlocProvider.of<PresentationBloc>(context).selectedPage;

    return BlocConsumer<PresentationBloc, PresentationState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: pages[BlocProvider.of<PresentationBloc>(context).selectedPage],
          bottomNavigationBar: ConvexAppBarWidget(
            selectedPage: selectedPage,
            tapItems: _tapItems, appKey:appKey ),
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
