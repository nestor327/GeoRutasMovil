part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class SignUpLoading extends UserState {}

final class SignUpSuccess extends UserState {}

final class SignUpFailure extends UserState {
  final String errorMessage;

  const SignUpFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
