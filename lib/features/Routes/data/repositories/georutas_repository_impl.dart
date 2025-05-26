import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/data/datasources/georutas_api_data_source.dart';
import 'package:georutasmovil/features/Routes/data/models/stop_model.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus_type.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate_detail.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_name_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_type_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_by_bus_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_routes_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinates_between_stops_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_schedule_by_bus_id_week_day_and_hour_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_range_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_trips_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/schedule.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip_paginated.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GeorutasRepositoryImpl implements GeoRutasRepository {
  final GeoRutasApiDataSource geoRutasApiDataSource;

  GeorutasRepositoryImpl({required this.geoRutasApiDataSource});

  @override
  Future<Either<Failure, List<Bus>>> GetBusesByType(
      GetBusesByTypeRequest request) async {
    try {
      final response = await geoRutasApiDataSource.GetBusesByType(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<BusType>>> GetBusTypes() async {
    try {
      final response = await geoRutasApiDataSource.GetBusTypes();

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Bus>>> GetBusesByName(
      GetBusesByNameRequest request) async {
    try {
      final response = await geoRutasApiDataSource.GetBusesByName(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Bus>>> GetBusesByLocation(
      GetBusesByLocationRequest request) async {
    try {
      final response = await geoRutasApiDataSource.GetBusesByLocation(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Coordinate>>> GetCoordinateRouteByScheduleId(
      GetCoordinateRoutesByScheduleIdRequest request) async {
    try {
      final response =
          await geoRutasApiDataSource.GetCoordinateRouteByScheduleId(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Coordinate>>> GetCoordinatesBetweenStops(
      GetCoordinatesBetweenStopsRequest request) async {
    try {
      final response =
          await geoRutasApiDataSource.GetCoordinatesBetweenStops(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Schedule>> GetScheduleByBusIdAndWeekDayAndTime(
      GetScheduleByBusIdWeekDayAndHourRequest request) async {
    try {
      final response =
          await geoRutasApiDataSource.GetScheduleByBusIdAndWeekDayAndTime(
              request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<StopModel>>> GetStopsByRange(
      GetStopByRangeRequest request) async {
    try {
      final response = await geoRutasApiDataSource.GetStopsByRange(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<StopModel>>> GetStopsByScheduleId(
      GetStopByScheduleIdRequest request) async {
    try {
      final response =
          await geoRutasApiDataSource.GetStopsByScheduleId(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, TripPaginated>> GetTripsByLocation(
      GetTripsByLocationRequest request) async {
    try {
      final response = await geoRutasApiDataSource.GetTripsByLocation(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, CoordinateDetails>> GetCoordinatesByBusId(
      GetCoordinateByBusIdRequest request) async {
    try {
      final response =
          await geoRutasApiDataSource.GetCoordinatesByBusId(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }
}
