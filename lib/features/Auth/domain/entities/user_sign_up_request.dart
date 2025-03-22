class UserSignUpRequest {
  final String Email;
  final String Password;
  final String FirstName;
  final String LastName;
  final int CountryId;
  final int TimeZoneId;
  final String? UserImageUrl;
  final int? LanguageId;

  UserSignUpRequest(
      {required this.Email,
      required this.Password,
      required this.FirstName,
      required this.LastName,
      required this.CountryId,
      required this.TimeZoneId,
      required this.UserImageUrl,
      required this.LanguageId});
}
