import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/main/presentation/bloc/local/presentation_bloc.dart';
import '../../../../core/colors/colors.dart';

class ConvexAppBarWidget extends StatelessWidget {
  final List<TabItem> tapItems;
  const ConvexAppBarWidget(
      {super.key, required this.selectedPage, required this.tapItems});

  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      initialActiveIndex: selectedPage,
      style: TabStyle.textIn,
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            MyColors.primaryColor,
            MyColors.secondaryColor,
          ]),
      items: tapItems,
      onTap: (index) {
        context
            .read<PresentationBloc>()
            .add(ChangeBottomNavicaitonBar(selectedPage: index));
      },
    );
  }
}
