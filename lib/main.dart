import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakan/bloc_observer.dart';
import 'package:sakan/config/routes/routes.dart';
import 'package:sakan/core/network/local/local_storage.dart';
import 'package:sakan/core/network/remote/dio_helper.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_bloc.dart';
import 'package:sakan/features/auth/presentation/pages/login_page.dart';
import 'package:sakan/features/main/presentation/bloc/widget_bloc.dart';
import 'package:sakan/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  LocalStorage.init();
  await initializDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RemoteUserBloc>(
            create: (context) => sl(),
          ),
          BlocProvider<WidgetBloc>(create: (context) => WidgetBloc())
        ],
        child: GetMaterialApp(
          textDirection: TextDirection.rtl,
          routes: routes,
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: const LoginPage(),
        ));
  }
}
