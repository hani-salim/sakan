import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../../core/colors/colors.dart';
import '../../bloc/local/widget_bloc.dart';
import 'menu_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WidgetBloc, WidgetState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ZoomDrawer(
            borderRadius: 30,
            menuBackgroundColor: MyColors.drawerColor,
            showShadow: true,
            isRtl: true,
            drawerShadowsBackgroundColor: MyColors.primaryColor,
            mainScreenAbsorbPointer: false,
            menuScreen: MenuPage(
                currentItem: BlocProvider.of<WidgetBloc>(context).currentItem,
                onSelectedItem: (item) {}),
            mainScreen: BlocProvider.of<WidgetBloc>(context).mainPage,
            androidCloseOnBackTap: true,
          );
        },
    );
  }
}
