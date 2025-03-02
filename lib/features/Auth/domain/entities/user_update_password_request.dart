class UserUpdatePasswordRequest {
  final String CurrentPassword;
  final String NewPassword;

  UserUpdatePasswordRequest(
      {required this.CurrentPassword, required this.NewPassword});
}
