import 'package:get_it/get_it.dart';
import 'package:sakan/features/auth/data/data_sources/remote/user_api_service.dart';
import 'package:sakan/features/auth/data/repository/user_repository_impl.dart';
import 'package:sakan/features/auth/domain/repository/user_repository.dart';
import 'package:sakan/features/auth/domain/usecases/login.dart';
import 'package:sakan/features/auth/domain/usecases/register.dart';
import 'package:sakan/features/auth/presentation/bloc/remote/remote_user_bloc.dart';

final sl = GetIt.instance;

Future<void> initializDependencies() async {
  
  //Dependencies
  sl.registerSingleton<UserApiService>(UserApiServiceWitDio());

  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));

  //Bloc
  sl.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(sl(), sl()));
}
