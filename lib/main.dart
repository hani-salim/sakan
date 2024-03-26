import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakan/bloc_observer.dart';
import 'package:sakan/config/routes/routes.dart';
import 'package:sakan/core/network/remote/dio_helper.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:sakan/features/main/presentation/pages/home_page.dart';
import 'package:sakan/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/app_theme.dart';

void main() async {
  await DioHelper.init();
  await initializDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteUserBloc>(
        create: (context) => sl(),
        child: GetMaterialApp(
            textDirection: TextDirection.rtl,
            routes: routes,
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            home: const HomePage()));
  }
}
