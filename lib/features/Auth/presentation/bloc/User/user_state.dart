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
