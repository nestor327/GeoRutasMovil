import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus_type.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_name_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_type_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_routes_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinates_between_stops_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_schedule_by_bus_id_week_day_and_hour_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_range_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_trips_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/schedule.dart';
import 'package:georutasmovil/features/Routes/domain/entities/stop.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip_paginated.dart';

abstract class GeoRutasRepository {
  Future<Either<Failure, List<Bus>>> GetBusesByType(
      GetBusesByTypeRequest request);
  Future<Either<Failure, List<BusType>>> GetBusTypes();
  Future<Either<Failure, List<Bus>>> GetBusesByName(
      GetBusesByNameRequest request);
  Future<Either<Failure, List<Bus>>> GetBusesByLocation(
      GetBusesByLocationRequest request);
  Future<Either<Failure, List<Coordinate>>> GetCoordinateRouteByScheduleId(
      GetCoordinateRoutesByScheduleIdRequest request);
  Future<Either<Failure, List<Coordinate>>> GetCoordinatesBetweenStops(
      GetCoordinatesBetweenStopsRequest request);
  Future<Either<Failure, List<Schedule>>> GetScheduleByBusIdAndWeekDayAndTime(
      GetScheduleByBusIdWeekDayAndHourRequest request);
  Future<Either<Failure, List<Stop>>> GetStopsByRange(
      GetStopByRangeRequest request);
  Future<Either<Failure, List<Stop>>> GetStopsByScheduleId(
      GetStopByScheduleIdRequest request);
  Future<Either<Failure, TripPaginated>> GetTripsByLocation(
      GetTripsByLocationRequest request);
}
