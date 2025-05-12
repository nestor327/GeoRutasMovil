import 'package:georutasmovil/features/Auth/data/datasources/user_local_data_source.dart';
import 'package:georutasmovil/features/Auth/data/datasources/user_remote_data_source.dart';
import 'package:georutasmovil/features/Auth/data/repositories/user_repository_impl.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/refresh_token_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/reset_password_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/sign_in_user_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/sign_up_user_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/update_password_use_case.dart';
import 'package:georutasmovil/features/Auth/presentation/bloc/user/user_bloc.dart';
import 'package:georutasmovil/features/Routes/data/datasources/georutas_api_data_source.dart';
import 'package:georutasmovil/features/Routes/data/repositories/georutas_repository_impl.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_bus_by_location_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_bus_by_name_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_bus_types_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_buses_by_type_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_coordinate_routes_by_schedule_id_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_coordinates_between_stops_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_schedule_by_bus_id_and_week_day_and_time_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_stop_by_range_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_stops_by_schedule_id_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_trips_by_location_use_case.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routelocations/route_locations_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';
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

  //Datasource user
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

  //Datasource Routes
  di.registerLazySingleton<GeoRutasApiDataSource>(
      () => GeoRutasApiDataSourceImpl());

  //Repository Routes
  di.registerLazySingleton<GeoRutasRepository>(
      () => GeorutasRepositoryImpl(geoRutasApiDataSource: di()));

  // Use Cases Routes
  di.registerLazySingleton(
      () => GetBusesByTypeUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(() => GetBusTypesUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(
      () => GetBusesByNameUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(
      () => GetBusByLocationUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(
      () => GetCoordinateRoutesByScheduleIdUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(
      () => GetCoordinatesBetweenStopsUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(() =>
      GetScheduleByBusIdAndWeekDayAndTimeUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(
      () => GetStopByRangeUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(
      () => GetStopsByScheduleIdUseCase(geoRutasRepository: di()));
  di.registerLazySingleton(
      () => GetTripsByLocationUseCase(geoRutasRepository: di()));

  //Bloc
  di.registerFactory(() => GetCoordinatesBloc(di(), di()));
  di.registerFactory(() => UserBloc(di(), di(), di(), di(), di()));
  di.registerFactory(() =>
      RouteBloc(di(), di(), di(), di(), di(), di(), di(), di(), di(), di()));
  di.registerFactory(() => RouteLocationBloc());
  di.registerFactory(() => BusesBloc());
}
