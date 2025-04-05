import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_type_request.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetBusesByTypeUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetBusesByTypeUseCase({required this.geoRutasRepository});

  Future<Either<Failure, List<Bus>>> call(GetBusesByTypeRequest request) async {
    return geoRutasRepository.GetBusesByType(request);
  }
}
