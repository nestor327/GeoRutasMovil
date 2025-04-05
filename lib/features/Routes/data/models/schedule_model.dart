import 'package:georutasmovil/features/Routes/domain/entities/schedule.dart';

class ScheduleModel extends Schedule {
  ScheduleModel(
      {required super.Id,
      required super.Alias,
      required super.Name,
      required super.DepartureTime,
      required super.ArrivalTime,
      required super.Duration,
      required super.OrigenLatitude,
      required super.OrigenLogitude,
      required super.DestinoLatitude,
      required super.DestinoLogitude,
      required super.IsActive,
      required super.BusId});

  factory ScheduleModel.fromJson(json) {
    return ScheduleModel(
        Id: json["id"],
        Alias: json["alias"],
        Name: json["name"],
        DepartureTime: json["departureTime"],
        ArrivalTime: json["arrivalTime"],
        Duration: json["duration"],
        OrigenLatitude: json["origenLatitude"],
        OrigenLogitude: json["origenLogitude"],
        DestinoLatitude: json["destinoLatitude"],
        DestinoLogitude: json["destinoLogitude"],
        IsActive: json["isActive"],
        BusId: json["busId"]);
  }

  static List<ScheduleModel> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      // Si es una lista, parseamos cada elemento a Entidad
      return jsonData.map((item) => ScheduleModel.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      // Si es un solo objeto, lo convertimos en una lista con un solo elemento
      return [ScheduleModel.fromJson(jsonData)];
    } else {
      return [];
    }
  }
}
