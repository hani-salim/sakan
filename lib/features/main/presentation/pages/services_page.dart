import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/card_box_decoration.dart';
import 'package:sakan/features/main/presentation/widgets/service_widget.dart';
import 'package:sakan/features/main/presentation/widgets/sliver_app_bar.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(body: _body(context: context));
  }
}

Widget _body({required BuildContext context}) {
  return CustomScrollView(
    slivers: [
      SliverAppBarWidget(
        title: 'الرئيسية',
        lottieFilePath: 'assets/lottieFiles/sakan.json',
        showAnimated: true,
        expandHeight: MediaQuery.of(context).size.height / 4,
      ),
      _servicesList(),
    ],
  );
}

Widget _servicesList() => SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: cardDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...services.map((e) => ServiceWidget(serviceEntities: e))
              ].animate(interval: const Duration(milliseconds: 150)).flip(),
            ),
          ),
        ),
      ),
    );
