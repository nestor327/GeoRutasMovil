import 'package:dartz/dartz.dart';
import 'package:georutasmovil/features/coodinates/domain/entities/Coordinate.dart';
import 'package:georutasmovil/core/error/Failure.dart';

abstract class CoordinateRepository {
  Future<Either<Failure, List<Coordinate>>> getCoordinatesBetweenTwoPoints(
      double firstLatitude,
      double secondLatitude,
      double firstLongitude,
      double secondLongitude);

  Future<Either<Failure, List<Coordinate>>> getCoordinatesBetweenTwoBusStops(
      int firstBusStopId, double secondBusStopId);
}
