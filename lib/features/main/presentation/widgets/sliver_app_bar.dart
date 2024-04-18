import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sakan/config/theme/header_widget.dart';
import 'package:sakan/features/main/presentation/widgets/menu_widget.dart';

class SliverAppBarWidget extends StatelessWidget {
  final String title;
  final String? lottieFilePath;
  final bool? showColor;
  final bool? showAnimated;
  final double? expandHeight;
  final double? collapsedHeight;
  final bool? pinned;
  final bool? isProfilePage;
  const SliverAppBarWidget({
    super.key,
    required this.title,
    this.lottieFilePath,
    this.showColor,
    this.showAnimated,
    this.expandHeight,
    this.collapsedHeight,
    this.pinned,
    this.isProfilePage,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      leading: const MenuWidget(),
      pinned: pinned ?? false,
      collapsedHeight: collapsedHeight,
      expandedHeight: expandHeight,
      flexibleSpace: _flexibleSpacerBar(context),
    );
  }

  FlexibleSpaceBar _flexibleSpacerBar(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [_headerWidget(), _profileImasge(context)],
        ),
      ),
    );
  }

  Visibility _profileImasge(BuildContext context) {
    return Visibility(
      visible: isProfilePage ?? false,
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 4 - 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 68.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage('assets/images/job.png'),
                ),
              ),
            ).animate().rotate(),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'هاني سليم',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ).animate().fade(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'طالب',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ).animate().fade(delay: const Duration(microseconds: 100)),
          ],
        ),
      ),
    );
  }

  SizedBox _headerWidget() {
    return SizedBox(
      height: 200,
      child: HeaderWidget(
        height: 200,
        lottieFilePath: lottieFilePath,
        showAnimated: showAnimated,
      ),
    );
  }
}
