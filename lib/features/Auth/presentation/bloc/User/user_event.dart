part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignUpUserEvent extends UserEvent {
  final UserSignUpRequest signUpRequest;

  const SignUpUserEvent({required this.signUpRequest});

  @override
  List<Object> get props => [signUpRequest];
}

class SignInUserEvent extends UserEvent {
  final UserSignInRequest signInRequest;

  const SignInUserEvent({required this.signInRequest});

  @override
  List<Object> get props => [signInRequest];
}

class RefreshTokenEvent extends UserEvent {
  final UserRefreshTokenRequest refreshTokenRequest;

  const RefreshTokenEvent({required this.refreshTokenRequest});

  @override
  List<Object> get props => [refreshTokenRequest];
}

class ResetPasswordEvent extends UserEvent {
  final UserResetPasswordRequest resetPasswordRequest;

  const ResetPasswordEvent({required this.resetPasswordRequest});

  @override
  List<Object> get props => [resetPasswordRequest];
}

class UpdatePasswordEvent extends UserEvent {
  final UserUpdatePasswordRequest updatePasswordRequest;

  const UpdatePasswordEvent({required this.updatePasswordRequest});

  @override
  List<Object> get props => [updatePasswordRequest];
}
