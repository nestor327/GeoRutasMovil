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

  static List<Coordinate> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      return jsonData.map((item) => Coordinate.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      return [Coordinate.fromJson(jsonData)];
    } else {
      return [];
    }
  }
}
