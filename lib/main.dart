import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakan/config/theme/app_theme.dart';
import 'package:sakan/features/main/presentation/bloc/local/presentation_bloc.dart';
import 'package:sakan/features/main/presentation/bloc/remote/bloc/services_bloc.dart';
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
          BlocProvider<PresentationBloc>(
              create: (context) => PresentationBloc()),
          BlocProvider<ServicesBloc>(create: (context) => ServicesBloc()),
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
