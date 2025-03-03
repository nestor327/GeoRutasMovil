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
  Map<String, dynamic> toJson() {
    return {
      "Id": Id,
      "UserName": UserName,
      "AccessToken": AccessToken,
      "AuthTokenValidityInMins": AuthTokenValidityInMins,
      "RefreshToken": RefreshToken,
      "RefreshTokenValidityInDays": RefreshTokenValidityInDays,
      "UserImageUrl": UserImageUrl,
      "CityId": CityId,
      "TimeZoneId": TimeZoneId,
      "LanguageId": LanguageId
    };
  }
}
