class GetScheduleByBusIdWeekDayAndHourRequest {
  final int BusId;
  final int WeekDayId;
  final DateTime Time;

  GetScheduleByBusIdWeekDayAndHourRequest(
      {required this.BusId, required this.WeekDayId, required this.Time});
}
