import 'package:georutasmovil/features/Routes/domain/entities/coordinate.dart';

class CoordinateModel extends Coordinate {
  CoordinateModel(
      {required super.Id, required super.Latitude, required super.Longitude});

  factory CoordinateModel.fromJson(json) {
    return CoordinateModel(
        Id: json["id"],
        Latitude: json["latitude"],
        Longitude: json["longitude"]);
  }

  static List<CoordinateModel> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      // Si es una lista, parseamos cada elemento a Entidad
      return jsonData.map((item) => CoordinateModel.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      // Si es un solo objeto, lo convertimos en una lista con un solo elemento
      return [CoordinateModel.fromJson(jsonData)];
    } else {
      return [];
    }
  }
}
