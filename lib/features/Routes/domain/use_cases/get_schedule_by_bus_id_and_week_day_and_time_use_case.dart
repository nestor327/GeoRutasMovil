import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_schedule_by_bus_id_week_day_and_hour_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/schedule.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GetScheduleByBusIdAndWeekDayAndTimeUseCase {
  final GeoRutasRepository geoRutasRepository;

  GetScheduleByBusIdAndWeekDayAndTimeUseCase(
      {required this.geoRutasRepository});

  Future<Either<Failure, List<Schedule>>> call(
      GetScheduleByBusIdWeekDayAndHourRequest request) async {
    return geoRutasRepository.GetScheduleByBusIdAndWeekDayAndTime(request);
  }
}
