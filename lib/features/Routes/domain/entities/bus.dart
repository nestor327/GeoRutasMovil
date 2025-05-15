class Bus {
  final int Id;
  final String Name;
  final int Frecuency;
  final bool IsActive;
  final int BusTypeId;

  Bus(
      {required this.Id,
      required this.Name,
      required this.Frecuency,
      required this.IsActive,
      required this.BusTypeId});

  factory Bus.fromJson(json) {
    return Bus(
        Id: json["id"],
        Name: json["name"],
        Frecuency: json["frecuency"],
        BusTypeId: json["busTypeId"],
        IsActive: json["isActive"]);
  }

  static List<Bus> parseEntidades(dynamic jsonData) {
    if (jsonData is List) {
      // Si es una lista, parseamos cada elemento a Entidad
      return jsonData.map((item) => Bus.fromJson(item)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      // Si es un solo objeto, lo convertimos en una lista con un solo elemento
      return [Bus.fromJson(jsonData)];
    } else {
      return [];
    }
  }
}
