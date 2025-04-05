class Stop {
  final int Id;
  final String Name;
  final int ScheduleId;
  final int CoordinateId;
  final int TotalArrivalTime;
  final double Latitude;
  final double Longitude;

  Stop(
      {required this.Id,
      required this.Name,
      required this.ScheduleId,
      required this.CoordinateId,
      required this.TotalArrivalTime,
      required this.Latitude,
      required this.Longitude});
}
