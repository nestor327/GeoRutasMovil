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
      required super.CityId,
      required super.TimeZoneId,
      required super.LanguageId});

  factory UserSignUpResponseModel.fromJson(json) {
    return UserSignUpResponseModel(
        Id: json['Id'],
        UserName: json['UserName'],
        AccessToken: json['AccessToken'],
        AuthTokenValidityInMins: json['AuthTokenValidityInMins'],
        RefreshToken: json['RefreshToken'],
        RefreshTokenValidityInDays: json['RefreshTokenValidityInDays'],
        UserImageUrl: json['UserImageUrl'],
        CityId: json['CityId'],
        TimeZoneId: json['TimeZoneId'],
        LanguageId: json[' LanguageI']);
  }
}
