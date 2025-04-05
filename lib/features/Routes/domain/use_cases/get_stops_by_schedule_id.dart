import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/stop.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetStopsByScheduleId {
  final GeoRutasRepository geoRutasRepository;

  GetStopsByScheduleId({required this.geoRutasRepository});

  Future<Either<Failure, List<Stop>>> call(
      GetStopByScheduleIdRequest request) async {
    return geoRutasRepository.GetStopsByScheduleId(request);
  }
}
