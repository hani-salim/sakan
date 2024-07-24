
import 'package:get_it/get_it.dart';
import 'package:sakan/features/student/data/data_sources/remote/student_api_service.dart';
import 'package:sakan/features/student/data/repository/student_repository_impl.dart';
import 'package:sakan/features/student/domain/repository/studnet_respository.dart';
import 'package:sakan/features/student/domain/useCases/get_rooms.dart';
import 'package:sakan/features/student/domain/useCases/get_unities.dart';
import 'package:sakan/features/student/domain/useCases/get_universities.dart';
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
  sl.registerSingleton<StudnetRepository>(StudentRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<GetUniversitiesUseCase>(GetUniversitiesUseCase(sl()));
  sl.registerSingleton<GetUnitiesUseCase>(GetUnitiesUseCase(sl()));
  sl.registerSingleton<GetRoomsUseCase>(GetRoomsUseCase(sl()));

  //Bloc
  sl.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(sl(), sl(),));
  
}
