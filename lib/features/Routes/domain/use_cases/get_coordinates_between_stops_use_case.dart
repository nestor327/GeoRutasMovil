import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinates_between_stops_request.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetCoordinatesBetweenStopsUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetCoordinatesBetweenStopsUseCase({required this.geoRutasRepository});

  Future<Either<Failure, List<Coordinate>>> call(
      GetCoordinatesBetweenStopsRequest request) async {
    return geoRutasRepository.GetCoordinatesBetweenStops(request);
  }
}
