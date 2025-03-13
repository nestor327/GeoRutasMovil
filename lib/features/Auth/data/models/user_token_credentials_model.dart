import 'package:georutasmovil/features/Auth/domain/entities/user_token_credentials.dart';

class UserTokenCredentialsModel extends UserTokenCredentials {
  UserTokenCredentialsModel(
      {required super.Id,
      required super.UserName,
      required super.AccessToken,
      required super.AuthTokenValidityInMins,
      required super.RefreshToken,
      required super.RefreshTokenValidityInDays,
      required super.UserImageUrl,
      required super.CityId,
      required super.TimeZoneId,
      required super.LanguageId});

  factory UserTokenCredentialsModel.fromEntity(UserTokenCredentials entitie) {
    return UserTokenCredentialsModel(
        Id: entitie.Id,
        UserName: entitie.UserName,
        AccessToken: entitie.AccessToken,
        AuthTokenValidityInMins: entitie.AuthTokenValidityInMins,
        RefreshToken: entitie.RefreshToken,
        RefreshTokenValidityInDays: entitie.RefreshTokenValidityInDays,
        UserImageUrl: entitie.UserImageUrl,
        CityId: entitie.CityId,
        TimeZoneId: entitie.TimeZoneId,
        LanguageId: entitie.LanguageId);
  }
  factory UserTokenCredentialsModel.fromJson(json) {
    return UserTokenCredentialsModel(
        AccessToken: json['accessToken'],
        AuthTokenValidityInMins: json['authTokenValidityInMins'],
        CityId: json['cityId'],
        Id: json['id'],
        LanguageId: json['languageId'],
        RefreshToken: json['refreshToken'],
        RefreshTokenValidityInDays: json['refreshTokenValidityInDays'],
        TimeZoneId: json['timeZoneId'],
        UserImageUrl: json['userImageUrl'],
        UserName: json['userName']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": Id,
      "userName": UserName,
      "accessToken": AccessToken,
      "authTokenValidityInMins": AuthTokenValidityInMins,
      "refreshToken": RefreshToken,
      "refreshTokenValidityInDays": RefreshTokenValidityInDays,
      "userImageUrl": UserImageUrl,
      "cityId": CityId,
      "timeZoneId": TimeZoneId,
      "languageId": LanguageId
    };
  }
}
