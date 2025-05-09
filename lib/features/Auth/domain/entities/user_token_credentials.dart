class UserTokenCredentials {
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

  UserTokenCredentials(
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
}
