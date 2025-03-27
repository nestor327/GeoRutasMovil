import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_response.dart';

class UserSignUpResponseModel extends UserSignUpResponse {
  UserSignUpResponseModel(
      {required super.Id,
      required super.UserName,
      required super.AccessToken,
      required super.AuthTokenValidityInMins,
      required super.RefreshToken,
      required super.RefreshTokenValidityInDays,
      required super.UserImageUrl,
      required super.CountryId,
      required super.TimeZoneId,
      required super.LanguageId});

  factory UserSignUpResponseModel.fromJson(json) {
    return UserSignUpResponseModel(
        Id: json['id'],
        UserName: json['userName'],
        AccessToken: json['accessToken'],
        AuthTokenValidityInMins: json['authTokenValidityInMins'],
        RefreshToken: json['refreshToken'],
        RefreshTokenValidityInDays: json['refreshTokenValidityInDays'],
        UserImageUrl: json['userImageUrl'],
        CountryId: json['countryId'] ?? 1,
        TimeZoneId: json['timeZoneId'] ?? 1,
        LanguageId: json[' languageId'] ?? 1);
  }
}
