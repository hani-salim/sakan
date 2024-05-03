import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/main/presentation/widgets/sliver_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context: context));
  }
}

Widget _body({required BuildContext context}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      CustomScrollView(
        slivers: [
          _sliverAppBar(),
          _userInformation(),
        ],
      ),
    ],
  );
}

SliverAppBarWidget _sliverAppBar() {
  return const SliverAppBarWidget(
    title: 'الملف الشخصي',
    expandHeight: 300,
    isProfilePage: true,
  
  );
}

SliverToBoxAdapter _userInformation() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              "معلومات المستخدم :  ",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Card(
              child: Column(
                children: <Widget>[
                  ...ListTile.divideTiles(color: Colors.grey, tiles: [
                    ...listTiles.map((e) => ListTile(
                          title: Text(e.title),
                          subtitle: Text(e.subTiltle),
                          leading: e.leading,
                        ))
                  ])
                ]
                    .animate(interval: Durations.short4)
                    .moveX(curve: Curves.easeIn, begin: -100, end: 0),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
