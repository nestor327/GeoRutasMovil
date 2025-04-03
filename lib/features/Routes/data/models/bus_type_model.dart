import 'package:georutasmovil/features/Routes/domain/entities/bus_type.dart';

class BusTypeModel extends BusType {
  BusTypeModel(
      {required super.Id, required super.Name, required super.Description});

  factory BusTypeModel.fromJson(json) {
    return BusTypeModel(
        Description: json["description"], Id: json["id"], Name: json["name"]);
  }

  static List<BusTypeModel> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      // Si es una lista, parseamos cada elemento a Entidad
      return jsonData.map((item) => BusTypeModel.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      // Si es un solo objeto, lo convertimos en una lista con un solo elemento
      return [BusTypeModel.fromJson(jsonData)];
    } else {
      throw Exception("Formato de JSON no reconocido");
    }
  }
}
