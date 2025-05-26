import 'package:georutasmovil/features/Routes/domain/entities/coordinate.dart';

class CoordinateDetails {
  int ScheduleId;
  int IdStopSouthNorthEnd;
  int IdStopNorthSouthInitial;
  int IdCoordinateSouthNorthEnd;
  int IdCoordinateNorthSouthInitial;
  List<Coordinate> coordinates;

  CoordinateDetails(
      {required this.ScheduleId,
      required this.IdCoordinateNorthSouthInitial,
      required this.IdCoordinateSouthNorthEnd,
      required this.IdStopNorthSouthInitial,
      required this.IdStopSouthNorthEnd,
      required this.coordinates});

  factory CoordinateDetails.fromJson(json) {
    return CoordinateDetails(
        ScheduleId: json["scheduleId"],
        IdCoordinateNorthSouthInitial: json["idCoordinateNorthSouthInitial"],
        IdCoordinateSouthNorthEnd: json["idCoordinateSouthNorthEnd"],
        IdStopNorthSouthInitial: json["idStopNorthSouthInitial"],
        IdStopSouthNorthEnd: json["idStopSouthNorthEnd"],
        coordinates: Coordinate.parseEntidades(json["coordinates"]));
  }
}
