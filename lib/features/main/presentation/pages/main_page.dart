import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/main/presentation/bloc/widget_bloc.dart';

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
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: selectedPage,
            style: TabStyle.textIn,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  MyColors.primaryColor,
                  MyColors.secondaryColor,
                ]),
            items: const [
              TabItem(
                icon: Icons.person,
                title: "الملف",
              ),
              TabItem(icon: Icons.history, title: "السجل"),
              TabItem(icon: Icons.house, title: "الرئيسسة"),
              TabItem(icon: Icons.newspaper, title: "الأخبار"),
              TabItem(icon: Icons.settings, title: "الإعدادات"),
            ],
            onTap: (index) {
              context
                  .read<WidgetBloc>()
                  .add(ChangeBottomNavicaitonBar(selectedPage: index));
            },
          ),
        );
      },
    );
  }
}
