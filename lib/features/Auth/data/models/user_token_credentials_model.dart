import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';

class UserTokenCredentialsModel extends AuthorizedUserResponse {
  UserTokenCredentialsModel(
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

  factory UserTokenCredentialsModel.fromEntity(AuthorizedUserResponse entitie) {
    return UserTokenCredentialsModel(
        Id: entitie.Id,
        UserName: entitie.UserName,
        AccessToken: entitie.AccessToken,
        AuthTokenValidityInMins: entitie.AuthTokenValidityInMins,
        RefreshToken: entitie.RefreshToken,
        RefreshTokenValidityInDays: entitie.RefreshTokenValidityInDays,
        UserImageUrl: entitie.UserImageUrl,
        CountryId: entitie.CountryId,
        TimeZoneId: entitie.TimeZoneId,
        LanguageId: entitie.LanguageId);
  }
  factory UserTokenCredentialsModel.fromJson(json) {
    return UserTokenCredentialsModel(
        AccessToken: json['accessToken'],
        AuthTokenValidityInMins: json['authTokenValidityInMins'],
        CountryId: json['countryId'],
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
      "countryId": CountryId,
      "timeZoneId": TimeZoneId,
      "languageId": LanguageId
    };
  }
}
