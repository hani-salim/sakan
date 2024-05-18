import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sakan/features/main/presentation/bloc/local/presentation_bloc.dart';
import '../../../../../core/colors/colors.dart';
import 'menu_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PresentationBloc, PresentationState>(
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
                currentItem: BlocProvider.of<PresentationBloc>(context).currentItem,
                onSelectedItem: (item) {}),
            mainScreen: BlocProvider.of<PresentationBloc>(context).mainPage,
            androidCloseOnBackTap: true,
          );
        },
    );
  }
}
