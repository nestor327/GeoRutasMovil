class Trip {
  final int Id;
  final int TotalWaitingTime;
  final int TotalTravelTime;
  final List<TripData> Trips;

  Trip(
      {required this.Id,
      required this.TotalWaitingTime,
      required this.TotalTravelTime,
      required this.Trips});
}

class TripData {
  final int Id;
  final int TripId;
  final int ScheduleId;
  final int BusId;
  final int BusTypeId;
  final int FromStopId;
  final double FromStopLatitude;
  final double FromStopLongitude;
  final int ToStopId;
  final double ToStopLatitude;
  final double ToStopLongitude;
  final int ArrivalTime;
  final int UTCDepartureTime;

  TripData(
      {required this.Id,
      required this.TripId,
      required this.ScheduleId,
      required this.BusId,
      required this.BusTypeId,
      required this.FromStopId,
      required this.FromStopLatitude,
      required this.FromStopLongitude,
      required this.ToStopId,
      required this.ToStopLatitude,
      required this.ToStopLongitude,
      required this.ArrivalTime,
      required this.UTCDepartureTime});
}
