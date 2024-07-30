import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constant/constant.dart';
import '../../../../config/theme/header_widget.dart';
import 'menu_widget.dart';

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
      leading:  const MenuWidget(),
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
          children: [_headerWidget(context: context), _profileImage(context)],
        ),
      ),
    );
  }

  Visibility _profileImage(BuildContext context) {
    return Visibility(
      visible: isProfilePage ?? false,
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 4 - 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 64.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  child: CachedNetworkImage(
                      placeholder: (context, url) =>
                           Lottie.asset('assets/lottieFiles/loading_image.json'),
                      imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          ),
                      imageUrl: user!.img ?? 'https://i.imgflip.com/3f2lx0.jpg'),
                ),
              ),
            ).animate().flipV(),
           
            const SizedBox(
              height: 15,
            ),
            Text(
              '${user!.firstName} ${user!.lastName}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ).animate().fade(),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${user!.job}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ).animate().fade(delay: const Duration(microseconds: 100)),
          ],
        ),
      ),
    );
  }

  SizedBox _headerWidget({required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: HeaderWidget(
          height: MediaQuery.of(context).size.height / 4,
          lottieFilePath: lottieFilePath,
          showAnimated: showAnimated,
          isMainPage: true),
    );
  }
}
