import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_name_request.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetBusesByNameUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetBusesByNameUseCase({required this.geoRutasRepository});

  Future<Either<Failure, List<Bus>>> call(GetBusesByNameRequest request) async {
    return geoRutasRepository.GetBusesByName(request);
  }
}
