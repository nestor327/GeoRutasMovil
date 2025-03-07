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
