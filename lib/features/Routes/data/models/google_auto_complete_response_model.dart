import 'package:georutasmovil/features/Routes/domain/entities/google_auto_complete_response.dart';
import 'package:georutasmovil/features/Routes/domain/entities/google_place_auto_complete.dart';

class GoogleAutoCompleteResponseModel extends GoogleAutoCompleteResponse {
  GoogleAutoCompleteResponseModel({super.predictions, required super.status});

  factory GoogleAutoCompleteResponseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? places = json["predictions"] as List<dynamic>?;

    return GoogleAutoCompleteResponseModel(
        predictions: places == null
            ? null
            : List<GooglePlaceAutoComplete>.from(places.map((place) =>
                GooglePlaceAutoComplete.fromJson(
                    place as Map<String, dynamic>))),
        status: json["status"] as String);
  }
}
