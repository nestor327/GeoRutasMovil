import 'package:flutter/material.dart';

class GetCoordinateByBusIdRequest {
  final int busId;
  final int weekDayId;
  final TimeOfDay time;

  GetCoordinateByBusIdRequest(
      {required this.busId, required this.weekDayId, required this.time});
}
