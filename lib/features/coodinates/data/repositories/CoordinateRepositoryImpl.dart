import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/coodinates/data/datasources/CoordinateNetApiSource.dart';
import 'package:georutasmovil/features/coodinates/domain/entities/Coordinate.dart';
import 'package:georutasmovil/features/coodinates/domain/repositories/CoordinateRepository.dart';

class CoordinateRepositoryImpl implements CoordinateRepository {
  final CoordinateNetApiSource dataSource;

  CoordinateRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CoordinateLocal>>>
      getCoordinatesBetweenTwoBusStops(
          int firstBusStopId, double secondBusStopId) async {
    try {
      final List<CoordinateLocal> coordinates =
          (await dataSource.getCoordinatesBetweenTwoBusStops(
                  firstBusStopId, secondBusStopId))
              .cast<CoordinateLocal>();
      return Right(coordinates);
    } on LocalFailure {
      return Left(LocalFailure());
    } on DioException {
      return Left(ServerFailure());
    } catch (error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<CoordinateLocal>>> getCoordinatesBetweenTwoPoints(
      double firstLatitude,
      double secondLatitude,
      double firstLongitude,
      double secondLongitude) async {
    try {
      final List<CoordinateLocal> coordinates =
          (await dataSource.getCoordinatesBetweenTwoPoints(firstLatitude,
                  secondLatitude, firstLongitude, secondLongitude))
              .cast<CoordinateLocal>();
      return Right(coordinates);
    } on LocalFailure {
      return Left(LocalFailure());
    } on DioException {
      return Left(ServerFailure());
    } catch (error) {
      return Left(LocalFailure());
    }
  }
}
