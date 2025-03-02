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
      required super.CityId,
      required super.TimeZoneId,
      required super.LanguageId});

  factory AuthorizedUserResponseModel.fromJson(json) {
    return AuthorizedUserResponseModel(
        AccessToken: json['AccessToken'],
        AuthTokenValidityInMins: json['AuthTokenValidityInMins'],
        CityId: json['CityId'],
        Id: json['Id'],
        LanguageId: json['LanguageId'],
        RefreshToken: json['RefreshToken'],
        RefreshTokenValidityInDays: json['RefreshTokenValidityInDays'],
        TimeZoneId: json['TimeZoneId'],
        UserImageUrl: json['TimeZoneId'],
        UserName: json['UserName']);
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
