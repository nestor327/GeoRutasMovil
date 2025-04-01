import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';

abstract class GeoRutasApiDataSource {
  Future<Either<Failure, int>> GetBusesByType();
  Future<Either<Failure, int>> GetBusesByName();
  Future<Either<Failure, int>> GetBusesByLocation();
  Future<Either<Failure, int>> GetBusTypes();
  Future<Either<Failure, int>> GetCoordinateRouteByScheduleId();
  Future<Either<Failure, int>> GetCoordinatesBetweenStops();
  Future<Either<Failure, int>> GetScheduleByBusIdAndWeekDayAndTime();
  Future<Either<Failure, int>> GetStopsByRange();
  Future<Either<Failure, int>> GetStopsByScheduleId();
  Future<Either<Failure, int>> GetTripsByLocation();
}
