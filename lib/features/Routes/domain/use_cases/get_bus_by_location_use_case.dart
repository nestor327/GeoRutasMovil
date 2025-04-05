import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetBusByLocationUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetBusByLocationUseCase({required this.geoRutasRepository});
  Future<Either<Failure, List<Bus>>> call(
      GetBusesByLocationRequest request) async {
    return geoRutasRepository.GetBusesByLocation(request);
  }
}
