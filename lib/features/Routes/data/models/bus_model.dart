import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';

class BusModel extends Bus {
  BusModel(
      {required super.Id,
      required super.Name,
      required super.Frecuency,
      required super.IsActive,
      required super.BusTypeId});

  factory BusModel.fromJson(json) {
    return BusModel(
        Id: json["id"],
        Name: json["name"],
        BusTypeId: json["busTypeId"],
        Frecuency: json["frecuency"],
        IsActive: json["isActive"]);
  }

  static List<BusModel> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      // Si es una lista, parseamos cada elemento a Entidad
      return jsonData.map((item) => BusModel.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      // Si es un solo objeto, lo convertimos en una lista con un solo elemento
      return [BusModel.fromJson(jsonData)];
    } else {
      return [];
    }
  }
}
