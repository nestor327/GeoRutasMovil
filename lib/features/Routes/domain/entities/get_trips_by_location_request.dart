class GetTripsByLocationRequest {
  double fromLatitude;
  double fromLongitude;
  double toLatitude;
  double toLongitude;
  int timeZoneId;
  int ratioInMeters;
  DateTime time;
  int WeekDayId;
  int page;
  int numberOfElements;

  GetTripsByLocationRequest(
      {required this.fromLatitude,
      required this.fromLongitude,
      required this.toLatitude,
      required this.toLongitude,
      required this.timeZoneId,
      required this.ratioInMeters,
      required this.time,
      required this.WeekDayId,
      required this.page,
      required this.numberOfElements});
}
