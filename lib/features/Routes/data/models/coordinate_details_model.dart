import 'package:georutasmovil/features/Routes/data/models/coordinate_model.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate_detail.dart';

class CoordinateDetailsModel extends CoordinateDetails {
  CoordinateDetailsModel(
      {required super.ScheduleId,
      required super.IdCoordinateNorthSouthInitial,
      required super.IdCoordinateSouthNorthEnd,
      required super.IdStopNorthSouthInitial,
      required super.IdStopSouthNorthEnd,
      required super.coordinates});

  factory CoordinateDetailsModel.fromJson(json) {
    return CoordinateDetailsModel(
        ScheduleId: json["scheduleId"],
        IdCoordinateNorthSouthInitial: json["idCoordinateNorthSouthInitial"],
        IdCoordinateSouthNorthEnd: json["idCoordinateSouthNorthEnd"],
        IdStopNorthSouthInitial: json["idStopNorthSouthInitial"],
        IdStopSouthNorthEnd: json["idStopSouthNorthEnd"],
        coordinates: CoordinateModel.parseEntidades(json["coordinates"]));
  }
}
