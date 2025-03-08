part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class SignUpLoading extends UserState {}

final class SignUpSuccess extends UserState {
  final UserSignUpResponse signUpResponse;
  const SignUpSuccess({required this.signUpResponse});
  @override
  List<Object> get props => [signUpResponse];
}

final class SignUpFailure extends UserState {
  final String errorMessage;
  const SignUpFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errorMessage;
  const SignInFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class SignInSuccess extends UserState {
  final AuthorizedUserResponse signInResponse;
  const SignInSuccess({required this.signInResponse});
  @override
  List<Object> get props => [signInResponse];
}

final class RefreshTokenLoading extends UserState {}

final class RefreshTokenFailure extends UserState {
  final String errorMessage;
  const RefreshTokenFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class RefreshTokenSuccess extends UserState {
  final AuthorizedUserResponse refreshTokenResponse;
  const RefreshTokenSuccess({required this.refreshTokenResponse});
  @override
  List<Object> get props => [refreshTokenResponse];
}

class ResetPasswordLoading extends UserState {}

final class ResetPasswordFailure extends UserState {
  final String errorMessage;
  const ResetPasswordFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class ResetPasswordSuccess extends UserState {
  final bool resetPasswordResponse;
  const ResetPasswordSuccess({required this.resetPasswordResponse});
  @override
  List<Object> get props => [resetPasswordResponse];
}

class UpdatePasswordLoading extends UserState {}

final class UpdatePasswordFailure extends UserState {
  final String errorMessage;
  const UpdatePasswordFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class UpdatePasswordSuccess extends UserState {
  final bool updatePasswordResponse;
  const UpdatePasswordSuccess({required this.updatePasswordResponse});
  @override
  List<Object> get props => [updatePasswordResponse];
}
