import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_response.dart';

class UserSignUpResponseModel extends UserSignUpResponse {
  UserSignUpResponseModel(
      {required super.Id,
      required super.UserName,
      required super.FirstName,
      required super.LastName,
      required super.Email,
      required super.IsActive,
      required super.Registered,
      required super.UserImageUrl,
      required super.CountryId,
      required super.TimeZoneId,
      required super.LanguageId});

  factory UserSignUpResponseModel.fromJson(json) {
    return UserSignUpResponseModel(
        Id: json['id'],
        UserName: json['userName'],
        FirstName: json['firstName'],
        LastName: json['lastName'],
        Email: json['email'],
        IsActive: json['isActive'],
        Registered: DateTime.parse(json['registered']),
        UserImageUrl: json['userImageUrl'],
        CountryId: json['countryId'] ?? 1,
        TimeZoneId: json['timeZoneId'] ?? 1,
        LanguageId: json[' languageId'] ?? 1);
  }
}
