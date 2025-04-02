class BusType {
  final String Id;
  final String Name;
  final String Description;

  BusType({required this.Id, required this.Name, required this.Description});

  factory BusType.fromJson(json) {
    return BusType(
        Id: json["id"], Name: json["name"], Description: json["description"]);
  }
}
