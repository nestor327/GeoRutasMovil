class UserRefreshTokenRequest {
  final String AccessToken;
  final String RefreshToken;

  UserRefreshTokenRequest(
      {required this.AccessToken, required this.RefreshToken});
}
