import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/student/presentation/bloc/local/presentation_bloc.dart';
import '../../../../../core/constant/constant.dart';
import '../../widgets/sliver_app_bar.dart';
import '../../widgets/theme_widget.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PresentationBloc, PresentationState>(
      listener: (context, state) {},
      builder: (contextm, state) => Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBarWidget(
            title: 'الثيمات',
            collapsedHeight: MediaQuery.of(context).size.height / 4,
            pinned: true,
          ),
          _buildThemeItems()
        ]),
      ),
    );
  }

  Widget _buildThemeItems() => SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ...themes.map((e) => ThemeWidget(
                        primaryColor: e.primaryColor,
                        secondaryColor: e.secondaryColor,
                        item: e,
                      )),
                ]
                    .animate(interval: Durations.short1)
                    .moveX(curve: Curves.easeIn, begin: -200, end: 0),
              ),
            ),
          ],
        ),
      );
}
