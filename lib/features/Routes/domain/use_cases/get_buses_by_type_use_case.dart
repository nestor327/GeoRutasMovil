import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus_type.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetBusesByTypeUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetBusesByTypeUseCase({required this.geoRutasRepository});
  Future<Either<Failure, List<BusType>>> call() async {
    return geoRutasRepository.GetBusesByType();
  }
}
