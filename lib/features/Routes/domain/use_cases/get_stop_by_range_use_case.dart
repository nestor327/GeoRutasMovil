import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_range_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/stop.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetStopByRangeUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetStopByRangeUseCase({required this.geoRutasRepository});

  Future<Either<Failure, List<Stop>>> call(
      GetStopByRangeRequest request) async {
    return geoRutasRepository.GetStopsByRange(request);
  }
}
