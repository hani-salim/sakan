import 'package:get_it/get_it.dart';
import 'features/auth/data/data_sources/remote/user_api_service.dart';
import 'features/auth/data/repository/user_repository_impl.dart';
import 'features/auth/domain/repository/user_repository.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/auth/domain/usecases/register.dart';
import 'features/auth/presentation/bloc/remote/remote_user_bloc.dart';

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
