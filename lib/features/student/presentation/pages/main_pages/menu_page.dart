import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sakan/core/widgets/loading_widget.dart';
import 'package:sakan/core/widgets/show_toast.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_event.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_state.dart';
import '../../../../../core/constant/constant.dart';
import '../../bloc/local/presentation_bloc.dart';
import '../../../../../core/colors/colors.dart';
import '../../../domain/entities/menu_entities.dart';

class MenuPage extends StatelessWidget {
  final MenuEntities? currentItem;
  final ValueChanged<MenuEntities> onSelectedItem;
  const MenuPage(
      {super.key, required this.currentItem, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteUserBloc, RemoteUserState>(
      listener: (context, state) {
        if(state is RemoteUserLoadingState){
          const LoadingWidget();
        }else if(state is RemoteUserLogoutSuccess){
          showToast(color: Colors.green, msg: 'تم تسجيل الخروج بنجاح');
          Navigator.pushNamed(context, loginPage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.drawerColor,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                          placeholder: (context, url) => Lottie.asset(
                              'assets/lottieFiles/loading_image.json'),
                          imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                          imageUrl:
                              user!.img ?? 'https://i.imgflip.com/3f2lx0.jpg'),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${user!.firstName} ${user!.lastName}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ...MenuItems.all.map((item) => buildMenuItem(item, context)),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      context.read<RemoteUserBloc>().add(Logout(refreshToken: user!.refreshToken!));
                    },
                    child: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }

  buildMenuItem(MenuEntities item, BuildContext context) => ListTileTheme(
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
  static const services = MenuEntities(icon: Icons.grid_3x3, title: "الخدمات");
  static const notification =
      MenuEntities(icon: Icons.notifications, title: "الإشعارات");
  static const settings =
      MenuEntities(icon: Icons.settings, title: "الإعدادات");
  static const themes = MenuEntities(icon: Icons.color_lens, title: "الثيمات");
  static const help = MenuEntities(icon: Icons.help, title: "مساعدة");
  static const aboutUs =
      MenuEntities(icon: Icons.question_answer, title: "حول التطبيق");

  static const List all = <MenuEntities>[
    services,
    notification,
    settings,
    themes,
    help,
    aboutUs
  ];
}
