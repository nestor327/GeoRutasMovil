class GetBusesByLocationRequest {
  final double RatioInMeters;
  final int WeekDayId;
  final int TimeZoneId;
  final double Latitude;
  final double Longitude;
  final DateTime Time;

  GetBusesByLocationRequest(
      {required this.RatioInMeters,
      required this.WeekDayId,
      required this.TimeZoneId,
      required this.Latitude,
      required this.Longitude,
      required this.Time});
}
