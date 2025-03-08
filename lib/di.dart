import 'package:georutasmovil/features/Auth/data/datasources/user_local_data_source.dart';
import 'package:georutasmovil/features/Auth/data/datasources/user_remote_data_source.dart';
import 'package:georutasmovil/features/Auth/data/repositories/user_repository_impl.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/refresh_token_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/reset_password_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/sign_in_user_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/sign_up_user_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/update_password_use_case.dart';
import 'package:georutasmovil/features/Auth/presentation/bloc/User/user_bloc.dart';
import 'package:georutasmovil/features/coodinates/data/datasources/CoordinateNetApiSource.dart';
import 'package:georutasmovil/features/coodinates/data/repositories/CoordinateRepositoryImpl.dart';
import 'package:georutasmovil/features/coodinates/domain/repositories/CoordinateRepository.dart';
import 'package:georutasmovil/features/coodinates/domain/use_cases/GetCoordinatesBetweenTwoBusStopsUseCase.dart';
import 'package:georutasmovil/features/coodinates/domain/use_cases/GetCoordinatesBetweenTwoPointsUseCase.dart';
import 'package:georutasmovil/features/coodinates/presentation/bloc/getCoordinates/GetCoordinatesBloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {
//Datasource Coordinate
  di.registerLazySingleton<CoordinateNetApiSource>(
      () => CoordinateNetApiSourceImpl());

  // Repository Coordinate
  di.registerLazySingleton<CoordinateRepository>(
      () => CoordinateRepositoryImpl(dataSource: di()));

  // Use Cases Coordinates
  di.registerLazySingleton(
      () => GetCoordinatesBetweenTwoPointsUseCase(repository: di()));
  di.registerLazySingleton(
      () => GetCoordinatesBetweenTwoBusStopsUseCase(repository: di()));

  //Datasource Coordinate
  di.registerLazySingleton<UserLocalDataSource>(
      () => HiveUserLocalDataSourceImpl());
  di.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());

// Repository User
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      userLocalDataSource: di(), userRemoteDataSource: di()));

  // Use Cases User
  di.registerLazySingleton(() => SignInUserUseCase(userRepository: di()));
  di.registerLazySingleton(() => SignUpUserUseCase(userRepository: di()));
  di.registerLazySingleton(() => RefreshTokenUseCase(userRepository: di()));
  di.registerLazySingleton(() => ResetPasswordUseCase(userRepository: di()));
  di.registerLazySingleton(() => UpdatePasswordUseCase(userRepository: di()));

  //Bloc
  di.registerFactory(() => GetCoordinatesBloc(di(), di()));
  di.registerFactory(() => UserBloc(di(), di(), di(), di(), di()));
}
