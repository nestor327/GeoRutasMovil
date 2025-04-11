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
}
