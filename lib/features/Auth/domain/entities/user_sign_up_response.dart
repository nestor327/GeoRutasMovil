class UserSignUpResponse {
  final String Id;
  final String UserName;
  final String FirstName;
  final String LastName;
  final String Email;
  final bool IsActive;
  final DateTime Registered;
  final String? UserImageUrl;
  final int? CountryId;
  final int? TimeZoneId;
  final int? LanguageId;

  UserSignUpResponse(
      {required this.Id,
      required this.UserName,
      required this.FirstName,
      required this.LastName,
      required this.Email,
      required this.IsActive,
      required this.Registered,
      required this.UserImageUrl,
      required this.CountryId,
      required this.TimeZoneId,
      required this.LanguageId});
}
