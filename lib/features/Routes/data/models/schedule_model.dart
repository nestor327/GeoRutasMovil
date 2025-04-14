import 'dart:ffi';

import 'package:flutter/material.dart';
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
    TimeOfDay stringToTimeOfDay(String timeString) {
      final parts = timeString.split(':');
      return TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }

    return ScheduleModel(
        Id: json["id"],
        Alias: json["alias"],
        Name: json["name"],
        DepartureTime: stringToTimeOfDay(json["departureTime"]),
        ArrivalTime: stringToTimeOfDay(json["arrivalTime"]),
        Duration: double.parse(json["duration"].toString()),
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
