import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/data/models/bus_model.dart';
import 'package:georutasmovil/features/Routes/data/models/bus_type_model.dart';
import 'package:georutasmovil/features/Routes/data/models/coordinate_model.dart';
import 'package:georutasmovil/features/Routes/data/models/schedule_model.dart';
import 'package:georutasmovil/features/Routes/data/models/stop_model.dart';
import 'package:georutasmovil/features/Routes/data/models/trip_paginated_model.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_name_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_type_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_routes_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinates_between_stops_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_schedule_by_bus_id_week_day_and_hour_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_range_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_trips_by_location_request.dart';
import 'package:georutasmovil/shared/utils/env.dart';

abstract class GeoRutasApiDataSource {
  Future<Either<Failure, List<BusModel>>> GetBusesByType(
      GetBusesByTypeRequest request);
  Future<Either<Failure, List<BusModel>>> GetBusesByName(
      GetBusesByNameRequest request);
  Future<Either<Failure, List<BusModel>>> GetBusesByLocation(
      GetBusesByLocationRequest request);
  Future<Either<Failure, List<BusTypeModel>>> GetBusTypes();
  Future<Either<Failure, List<CoordinateModel>>> GetCoordinateRouteByScheduleId(
      GetCoordinateRoutesByScheduleIdRequest request);
  Future<Either<Failure, List<CoordinateModel>>> GetCoordinatesBetweenStops(
      GetCoordinatesBetweenStopsRequest request);
  Future<Either<Failure, List<ScheduleModel>>>
      GetScheduleByBusIdAndWeekDayAndTime(
          GetScheduleByBusIdWeekDayAndHourRequest request);
  Future<Either<Failure, List<StopModel>>> GetStopsByRange(
      GetStopByRangeRequest request);
  Future<Either<Failure, List<StopModel>>> GetStopsByScheduleId(
      GetStopByScheduleIdRequest request);
  Future<Either<Failure, TripPaginatedModel>> GetTripsByLocation(
      GetTripsByLocationRequest request);
}

class GeoRutasApiDataSourceImpl implements GeoRutasApiDataSource {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, List<BusTypeModel>>> GetBusTypes() async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        dynamic jsonParse = json.decode(resp.data);
        final List<BusTypeModel> busTypeModels =
            BusTypeModel.parseEntidades(jsonParse);
        return Right(busTypeModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<BusModel>>> GetBusesByLocation(
      GetBusesByLocationRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        dynamic jsonParse = json.decode(resp.data);
        final List<BusModel> busTypeModels = BusModel.parseEntidades(jsonParse);
        return Right(busTypeModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<BusModel>>> GetBusesByName(
      GetBusesByNameRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        dynamic jsonParse = json.decode(resp.data);
        final List<BusModel> busTypeModels = BusModel.parseEntidades(jsonParse);
        return Right(busTypeModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<BusModel>>> GetBusesByType(
      GetBusesByTypeRequest request) async {
    try {
      final resp = await dio.get(
        'http://192.168.1.14:5005/v1/bus/buses-by-bustype?busTypeId=${request.BusTypeId}',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
            'X-Api-Key': EnvConfig.geoRutasApyKey
          },
        ),
      );

      if (resp.statusCode == 200) {
        final List<BusModel> busTypeModels = BusModel.parseEntidades(resp.data);

        return Right(busTypeModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      print("El error fue: " + Error.toString());
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<CoordinateModel>>> GetCoordinateRouteByScheduleId(
      GetCoordinateRoutesByScheduleIdRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        final List<CoordinateModel> coordinatesModels =
            CoordinateModel.parseEntidades(resp.data);
        return Right(coordinatesModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<CoordinateModel>>> GetCoordinatesBetweenStops(
      GetCoordinatesBetweenStopsRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        dynamic jsonParse = json.decode(resp.data);
        final List<CoordinateModel> coordinatesModels =
            CoordinateModel.parseEntidades(jsonParse);
        return Right(coordinatesModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<ScheduleModel>>>
      GetScheduleByBusIdAndWeekDayAndTime(
          GetScheduleByBusIdWeekDayAndHourRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        dynamic jsonParse = json.decode(resp.data);
        final List<ScheduleModel> coordinatesModels =
            ScheduleModel.parseEntidades(jsonParse);
        return Right(coordinatesModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<StopModel>>> GetStopsByRange(
      GetStopByRangeRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        dynamic jsonParse = json.decode(resp.data);
        final List<StopModel> coordinatesModels =
            StopModel.parseEntidades(jsonParse);
        return Right(coordinatesModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<StopModel>>> GetStopsByScheduleId(
      GetStopByScheduleIdRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        dynamic jsonParse = json.decode(resp.data);
        final List<StopModel> coordinatesModels =
            StopModel.parseEntidades(jsonParse);
        return Right(coordinatesModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, TripPaginatedModel>> GetTripsByLocation(
      GetTripsByLocationRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (resp.statusCode == 200) {
        dynamic jsonParse = json.decode(resp.data);
        final TripPaginatedModel coordinatesModels =
            TripPaginatedModel.fromJson(jsonParse);
        return Right(coordinatesModels);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }
}
