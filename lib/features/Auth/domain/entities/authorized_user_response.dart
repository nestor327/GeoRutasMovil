class AuthorizedUserResponse {
  final String Id;
  final String UserName;
  final String AccessToken;
  final int AuthTokenValidityInMins;
  final String RefreshToken;
  final int RefreshTokenValidityInDays;
  final String? UserImageUrl;
  final int? CountryId;
  final int? TimeZoneId;
  final int? LanguageId;

  AuthorizedUserResponse(
      {required this.Id,
      required this.UserName,
      required this.AccessToken,
      required this.AuthTokenValidityInMins,
      required this.RefreshToken,
      required this.RefreshTokenValidityInDays,
      required this.UserImageUrl,
      required this.CountryId,
      required this.TimeZoneId,
      required this.LanguageId});

  factory AuthorizedUserResponse.fromJson(json) {
    return AuthorizedUserResponse(
        Id: json["id"],
        UserName: json["userName"],
        AccessToken: json["accessToken"],
        AuthTokenValidityInMins: json["authTokenValidityInMins"],
        RefreshToken: json["refreshToken"],
        RefreshTokenValidityInDays: json["refreshTokenValidityInDays"],
        UserImageUrl: json["userImageUrl"],
        CountryId: json["countryId"],
        TimeZoneId: json["timeZoneId"],
        LanguageId: json["languageId"]);
  }
}
