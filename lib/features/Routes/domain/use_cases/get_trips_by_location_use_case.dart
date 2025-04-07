import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_trips_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip_paginated.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetTripsByLocationUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetTripsByLocationUseCase({required this.geoRutasRepository});

  Future<Either<Failure, TripPaginated>> call(
      GetTripsByLocationRequest request) async {
    return geoRutasRepository.GetTripsByLocation(request);
  }
}
