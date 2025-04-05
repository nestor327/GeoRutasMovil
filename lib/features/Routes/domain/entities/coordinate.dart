class Coordinate {
  final int Id;
  final double Latitude;
  final double Longitude;

  Coordinate(
      {required this.Id, required this.Latitude, required this.Longitude});

  factory Coordinate.fromJson(json) {
    return Coordinate(
        Id: json["id"],
        Latitude: json["latitude"],
        Longitude: json["longitude"]);
  }
}
