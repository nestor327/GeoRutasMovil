class Schedule {
  final int Id;
  final String Alias;
  final String Name;
  final DateTime DepartureTime;
  final DateTime ArrivalTime;
  final double Duration;
  final double OrigenLatitude;
  final double OrigenLogitude;
  final double DestinoLatitude;
  final double DestinoLogitude;
  final bool IsActive;
  final int BusId;

  Schedule(
      {required this.Id,
      required this.Alias,
      required this.Name,
      required this.DepartureTime,
      required this.ArrivalTime,
      required this.Duration,
      required this.OrigenLatitude,
      required this.OrigenLogitude,
      required this.DestinoLatitude,
      required this.DestinoLogitude,
      required this.IsActive,
      required this.BusId});
}
