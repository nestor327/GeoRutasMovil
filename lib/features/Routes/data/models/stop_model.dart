import 'package:georutasmovil/features/Routes/domain/entities/stop.dart';

class StopModel extends Stop {
  StopModel(
      {required super.Id,
      required super.Name,
      required super.ScheduleId,
      required super.CoordinateId,
      required super.TotalArrivalTime,
      required super.Latitude,
      required super.Longitude});

  factory StopModel.fromJson(json) {
    return StopModel(
        Id: json["id"],
        Name: json["name"],
        ScheduleId: json["scheduleId"],
        CoordinateId: json["coordinateId"],
        TotalArrivalTime: json["totalArrivalTime"],
        Latitude: json["latitude"],
        Longitude: json["longitude"]);
  }

  static List<StopModel> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      // Si es una lista, parseamos cada elemento a Entidad
      return jsonData.map((item) => StopModel.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      // Si es un solo objeto, lo convertimos en una lista con un solo elemento
      return [StopModel.fromJson(jsonData)];
    } else {
      return [];
    }
  }
}
