import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/features/main/presentation/bloc/local/presentation_bloc.dart';
import '../../../../../core/colors/colors.dart';
import '../../../domain/entities/menu_item.dart';

class MenuPage extends StatelessWidget {
  final MenuItem? currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuPage(
      {super.key, required this.currentItem, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.drawerColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 8),
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage(
                  'assets/images/malfunction.png',
                ),
              ),
            ),
            const Text(
              "هاني سليم",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            ...MenuItems.all.map((item) => buildMenuItem(item, context)),
          ],
        ),
      )),
    );
  }

  buildMenuItem(MenuItem item, BuildContext context) => ListTileTheme(
        contentPadding: const EdgeInsets.only(right: 20),
        minLeadingWidth: 20,
        child: ListTile(
          textColor: Colors.white,
          iconColor: Colors.white,
          selectedColor: MyColors.primaryColor,
          selected: currentItem == item,
          leading: Icon(
            item.icon,
          ),
          title: Text(
            item.title,
          ),
          onTap: () {
            context.read<PresentationBloc>().add(ChangeDrwerItem(item: item));
          },
        ),
      );
}

class MenuItems {
  static const services = MenuItem(icon: Icons.grid_3x3, title: "الخدمات");
  static const notification =
      MenuItem(icon: Icons.notifications, title: "الإشعارات");
  static const settings = MenuItem(icon: Icons.settings, title: "الإعدادات");
  static const themes = MenuItem(icon: Icons.color_lens, title: "الثيمات");
  static const help = MenuItem(icon: Icons.help, title: "مساعدة");
  static const aboutUs =
      MenuItem(icon: Icons.question_answer, title: "حول التطبيق");

  static const List all = <MenuItem>[
    services,
    notification,
    settings,
    themes,
    help,
    aboutUs
  ];
}
