class UserSingUpRequest {
  final String Email;
  final String Password;
  final int FirstName;
  final String LastName;
  final int CityId;
  final String? TimeZoneId;
  final int? UserImageUrl;
  final int? LanguageId;

  UserSingUpRequest(
      {required this.Email,
      required this.Password,
      required this.FirstName,
      required this.LastName,
      required this.CityId,
      required this.TimeZoneId,
      required this.UserImageUrl,
      required this.LanguageId});
}
