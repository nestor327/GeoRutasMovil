import 'package:flutter/material.dart';

class GetScheduleByBusIdWeekDayAndHourRequest {
  final int BusId;
  final int WeekDayId;
  final TimeOfDay Time;

  GetScheduleByBusIdWeekDayAndHourRequest(
      {required this.BusId, required this.WeekDayId, required this.Time});
}
