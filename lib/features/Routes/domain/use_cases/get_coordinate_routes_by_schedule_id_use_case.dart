import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_routes_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetCoordinateRoutesByScheduleIdUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetCoordinateRoutesByScheduleIdUseCase({required this.geoRutasRepository});

  Future<Either<Failure, List<Coordinate>>> call(
      GetCoordinateRoutesByScheduleIdRequest request) async {
    return geoRutasRepository.GetCoordinateRouteByScheduleId(request);
  }
}
