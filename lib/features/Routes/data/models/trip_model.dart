import 'package:georutasmovil/features/Routes/domain/entities/trip.dart';

class TripModel extends Trip {
  TripModel(
      {required super.Id,
      required super.TotalWaitingTime,
      required super.TotalTravelTime,
      required super.Trips});

  factory TripModel.fromJson(json) {
    return TripModel(
        TotalTravelTime: json["totalTravelTime"],
        TotalWaitingTime: json["TotalWaitingTime"],
        Id: json["id"],
        Trips: TripDataModel.parseEntidades(json["trips"]));
  }

  static List<TripModel> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      // Si es una lista, parseamos cada elemento a Entidad
      return jsonData.map((item) => TripModel.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      // Si es un solo objeto, lo convertimos en una lista con un solo elemento
      return [TripModel.fromJson(jsonData)];
    } else {
      return [];
    }
  }
}

class TripDataModel extends TripData {
  TripDataModel(
      {required super.Id,
      required super.TripId,
      required super.ScheduleId,
      required super.BusId,
      required super.BusTypeId,
      required super.FromStopId,
      required super.FromStopLatitude,
      required super.FromStopLongitude,
      required super.ToStopId,
      required super.ToStopLatitude,
      required super.ToStopLongitude,
      required super.ArrivalTime,
      required super.UTCDepartureTime});

  factory TripDataModel.fromJson(json) {
    return TripDataModel(
        Id: json["id"],
        TripId: json["tripId"],
        ScheduleId: json["scheduleId"],
        BusId: json["busId"],
        BusTypeId: json["busTypeId"],
        FromStopId: json["fromStopId"],
        FromStopLatitude: json["fromStopLatitude"],
        FromStopLongitude: json["fromStopLongitude"],
        ToStopId: json["toStopId"],
        ToStopLatitude: json["toStopLatitude"],
        ToStopLongitude: json["toStopLongitude"],
        ArrivalTime: json["arrivalTime"],
        UTCDepartureTime: json["uTCDepartureTime"]);
  }

  static List<TripDataModel> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      // Si es una lista, parseamos cada elemento a Entidad
      return jsonData.map((item) => TripDataModel.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      // Si es un solo objeto, lo convertimos en una lista con un solo elemento
      return [TripDataModel.fromJson(jsonData)];
    } else {
      return [];
    }
  }
}
