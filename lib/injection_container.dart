
import 'package:get_it/get_it.dart';
import 'package:sakan/features/auth/domain/usecases/logout.dart';
import 'package:sakan/features/student/domain/useCases/submit_bread_order.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/student_bloc.dart';
import 'features/student/data/data_sources/remote/student_api_service.dart';
import 'features/student/data/repository/student_repository_impl.dart';
import 'features/student/domain/repository/studnet_respository.dart';
import 'features/student/domain/useCases/get_rooms.dart';
import 'features/student/domain/useCases/get_unities.dart';
import 'features/student/domain/useCases/get_universities.dart';
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
  sl.registerSingleton<StudentApiService>(StudentApiServiceWithDio());

  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<StudentRepository>(StudentRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase(sl()));
  sl.registerSingleton<GetUniversitiesUseCase>(GetUniversitiesUseCase(sl()));
  sl.registerSingleton<GetUnitiesUseCase>(GetUnitiesUseCase(sl()));
  sl.registerSingleton<GetRoomsUseCase>(GetRoomsUseCase(sl()));
  sl.registerSingleton<SubmitABreadOrderUseCase>(SubmitABreadOrderUseCase(sl()));

  //Bloc
  sl.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(sl(), sl(),sl(),));
  
}
