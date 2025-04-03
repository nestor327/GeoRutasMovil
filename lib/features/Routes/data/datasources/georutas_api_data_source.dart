import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/data/models/bus_type_model.dart';

abstract class GeoRutasApiDataSource {
  Future<Either<Failure, List<BusTypeModel>>> GetBusesByType();
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

class GeoRutasApiDataSourceImpl implements GeoRutasApiDataSource {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, int>> GetBusTypes() {
    // TODO: implement GetBusTypes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> GetBusesByLocation() {
    // TODO: implement GetBusesByLocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> GetBusesByName() {
    // TODO: implement GetBusesByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BusTypeModel>>> GetBusesByType() async {
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
  Future<Either<Failure, int>> GetCoordinateRouteByScheduleId() {
    // TODO: implement GetCoordinateRouteByScheduleId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> GetCoordinatesBetweenStops() {
    // TODO: implement GetCoordinatesBetweenStops
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> GetScheduleByBusIdAndWeekDayAndTime() {
    // TODO: implement GetScheduleByBusIdAndWeekDayAndTime
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> GetStopsByRange() {
    // TODO: implement GetStopsByRange
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> GetStopsByScheduleId() {
    // TODO: implement GetStopsByScheduleId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> GetTripsByLocation() {
    // TODO: implement GetTripsByLocation
    throw UnimplementedError();
  }
}
