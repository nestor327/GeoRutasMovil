sealed class GetCoordinatesEvent {}

class OnGetCoordinatesBetweenTwoBusStops extends GetCoordinatesEvent {
  final int firstBusStopId;
  final double secondBusStopId;

  OnGetCoordinatesBetweenTwoBusStops(
      {required this.firstBusStopId, required this.secondBusStopId});
}

class OnGetCoordinatesBetweenTwoPoints extends GetCoordinatesEvent {
  final double firstLatitude;
  final double secondLatitude;
  final double firstLongitude;
  final double secondLongitude;
  OnGetCoordinatesBetweenTwoPoints(this.firstLatitude, this.secondLatitude,
      this.firstLongitude, this.secondLongitude);
}
