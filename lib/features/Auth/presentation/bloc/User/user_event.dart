part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignUpUserEvent extends UserEvent {
  final String email;
  final String password;

  const SignUpUserEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
