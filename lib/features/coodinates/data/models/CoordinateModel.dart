import 'package:georutasmovil/features/coodinates/domain/entities/coordinate.dart';

class CoordinateModel extends CoordinateLocal {
  CoordinateModel(
      {required super.coordinate_id,
      required super.longitude,
      required super.latitude});

  factory CoordinateModel.fromJson(json) {
    return CoordinateModel(
        coordinate_id: json["coordinate_id"],
        longitude: json["longitude"]["value"],
        latitude: json["latitude"]);
  }

  static List<CoordinateModel> fromJsonList(jsonList) {
    return jsonList.map((json) => CoordinateModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "coordinate_id": coordinate_id,
      "longitude": {"value": longitude},
      "latitude": latitude
    };
  }
}
