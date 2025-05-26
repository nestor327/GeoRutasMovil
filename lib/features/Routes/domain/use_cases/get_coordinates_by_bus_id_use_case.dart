import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate_detail.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_by_bus_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetCoordinatesByBusIdUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetCoordinatesByBusIdUseCase({required this.geoRutasRepository});

  Future<Either<Failure, CoordinateDetails>> call(
      GetCoordinateByBusIdRequest request) async {
    return geoRutasRepository.GetCoordinatesByBusId(request);
  }
}
