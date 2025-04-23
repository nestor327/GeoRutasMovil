class GooglePlaceAutoComplete {
  final String description;
  final String placeId;
  final String mainText;
  final String? secondaryText;

  GooglePlaceAutoComplete(
      {required this.description,
      required this.placeId,
      required this.mainText,
      this.secondaryText});

  factory GooglePlaceAutoComplete.fromJson(Map<String, dynamic> json) {
    return GooglePlaceAutoComplete(
        description: json["description"] as String,
        mainText: json["structured_formatting"]["main_text"] as String,
        placeId: json["place_id"] as String,
        secondaryText:
            json["structured_formatting"]["secondary_text"] as String?);
  }
}
