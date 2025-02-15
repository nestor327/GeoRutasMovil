import 'package:georutasmovil/features/coodinates/data/datasources/CoordinateNetApiSource.dart';
import 'package:georutasmovil/features/coodinates/data/repositories/CoordinateRepositoryImpl.dart';
import 'package:georutasmovil/features/coodinates/domain/repositories/CoordinateRepository.dart';
import 'package:georutasmovil/features/coodinates/domain/use_cases/GetCoordinatesBetweenTwoBusStopsUseCase.dart';
import 'package:georutasmovil/features/coodinates/domain/use_cases/GetCoordinatesBetweenTwoPointsUseCase.dart';
import 'package:georutasmovil/features/coodinates/presentation/bloc/getCoordinates/GetCoordinatesBloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {
//Datasource
  di.registerLazySingleton<CoordinateNetApiSource>(
      () => CoordinateNetApiSourceImpl());

  // Repository
  di.registerLazySingleton<CoordinateRepository>(
      () => CoordinateRepositoryImpl(dataSource: di()));

  // Use Cases
  di.registerLazySingleton(
      () => GetCoordinatesBetweenTwoPointsUseCase(repository: di()));
  di.registerLazySingleton(
      () => GetCoordinatesBetweenTwoBusStopsUseCase(repository: di()));

  //Bloc
  di.registerFactory(() => GetCoordinatesBloc(di(), di()));
}
