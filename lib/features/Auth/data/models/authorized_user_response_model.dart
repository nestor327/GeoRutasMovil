import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';

class AuthorizedUserResponseModel extends AuthorizedUserResponse {
  AuthorizedUserResponseModel(
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

  factory AuthorizedUserResponseModel.fromJson(json) {
    return AuthorizedUserResponseModel(
        AccessToken: json['accessToken'] ?? "",
        AuthTokenValidityInMins: json['authTokenValidityInMins'],
        CountryId: json['countryId'] ?? 1,
        Id: json['id'],
        LanguageId: json['languageId'] ?? 1,
        RefreshToken: json['refreshToken'],
        RefreshTokenValidityInDays: json['refreshTokenValidityInDays'],
        TimeZoneId: json['timeZoneId'] ?? 1,
        UserImageUrl: json['userImageUrl'],
        UserName: json['userName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'AccessToken': AccessToken,
      'AuthTokenValidityInMins': AuthTokenValidityInMins,
      'CountryId': CountryId,
      'Id': Id,
      'LanguageId': LanguageId,
      'RefreshToken': RefreshToken,
      'RefreshTokenValidityInDays': RefreshTokenValidityInDays,
      'TimeZoneId': TimeZoneId,
      'UserImageUrl': UserImageUrl,
      'UserName': UserName
    };
  }
}
