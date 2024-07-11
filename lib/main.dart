import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakan/config/theme/app_theme.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/auth/data/models/user.dart';
import 'package:sakan/features/student/presentation/bloc/local/presentation_bloc.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/services_bloc.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/home_page.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/main_page.dart';
import 'bloc_observer.dart';
import 'config/routes/routes.dart';
import 'core/network/local/local_storage.dart';
import 'core/network/remote/dio_helper.dart';
import 'features/auth/presentation/bloc/remote/remote_user_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await LocalStorage.init();
  await initializDependencies();
  Bloc.observer = MyBlocObserver();
  Widget startPage;

  LocalStorage.getData(key: 'user') != null
      ? user =UserModel.fromJson(jsonDecode(LocalStorage.getData(key: 'user'))) 
      : null;

  LocalStorage.getData(key: 'user') == null
      ? startPage = const LoginPage()
      : startPage = const HomePage();

  
  runApp(MyApp(
    startPage: startPage,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startPage;
  const MyApp({super.key, required this.startPage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RemoteUserBloc>(
            create: (context) => sl(),
          ),
          BlocProvider<PresentationBloc>(
              create: (context) => PresentationBloc()),
          BlocProvider<ServicesBloc>(create: (context) => ServicesBloc()),
        ],
        child: GetMaterialApp(
          textDirection: TextDirection.rtl,
          routes: routes,
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: startPage,
        ));
  }
}
