class UserSignUpResponse {
  final String Id;
  final String UserName;
  final String AccessToken;
  final int AuthTokenValidityInMins;
  final String RefreshToken;
  final int RefreshTokenValidityInDays;
  final String? UserImageUrl;
  final int? CityId;
  final int? TimeZoneId;
  final int? LanguageId;

  UserSignUpResponse(
      {required this.Id,
      required this.UserName,
      required this.AccessToken,
      required this.AuthTokenValidityInMins,
      required this.RefreshToken,
      required this.RefreshTokenValidityInDays,
      required this.UserImageUrl,
      required this.CityId,
      required this.TimeZoneId,
      required this.LanguageId});
}
