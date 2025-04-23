import 'package:georutasmovil/features/Routes/domain/entities/google_place_auto_complete.dart';

class GoogleAutoCompleteResponse {
  final List<GooglePlaceAutoComplete>? predictions;
  final String status;

  GoogleAutoCompleteResponse({this.predictions, required this.status});

  factory GoogleAutoCompleteResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic>? places = json["predictions"] as List<dynamic>?;

    return GoogleAutoCompleteResponse(
        predictions: places == null
            ? null
            : List<GooglePlaceAutoComplete>.from(places.map((place) =>
                GooglePlaceAutoComplete.fromJson(
                    place as Map<String, dynamic>))),
        status: json["status"] as String);
  }
}
