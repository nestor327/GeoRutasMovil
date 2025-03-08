import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Auth/domain/entities/Refresh_token_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_reset_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_in_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_update_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/refresh_token_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/reset_password_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/sign_in_user_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/sign_up_user_use_case.dart';
import 'package:georutasmovil/features/Auth/domain/use_cases/update_password_use_case.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RefreshTokenUseCase _refreshTokenUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final SignInUserUseCase _signInUserUseCase;
  final SignUpUserUseCase _signUpUserUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;

  UserBloc(
      this._refreshTokenUseCase,
      this._resetPasswordUseCase,
      this._signInUserUseCase,
      this._signUpUserUseCase,
      this._updatePasswordUseCase)
      : super(UserInitial()) {
    on<SignUpUserEvent>((event, emit) async {
      emit(SignUpLoading());

      final response = await _signUpUserUseCase(event.signUpRequest);

      response.fold(
          (f) => emit(const SignUpFailure(errorMessage: "SignUp Fail")),
          (success) => emit(SignUpSuccess(signUpResponse: success)));
    });

    on<SignInUserEvent>((event, emit) async {
      emit(SignInLoading());

      final response = await _signInUserUseCase(event.signInRequest);

      response.fold(
          (f) => emit(const SignInFailure(errorMessage: "SignIn Fail")),
          (success) => emit(SignInSuccess(signInResponse: success)));
    });

    on<RefreshTokenEvent>((event, emit) async {
      emit(RefreshTokenLoading());

      final response = await _refreshTokenUseCase(event.refreshTokenRequest);

      response.fold(
          (f) => emit(
              const RefreshTokenFailure(errorMessage: "RefreshToken Fail")),
          (success) =>
              emit(RefreshTokenSuccess(refreshTokenResponse: success)));
    });

    on<ResetPasswordEvent>((event, emit) async {
      emit(ResetPasswordLoading());

      final response = await _resetPasswordUseCase(event.resetPasswordRequest);

      response.fold(
          (f) => emit(
              const ResetPasswordFailure(errorMessage: "ResetPassword Fail")),
          (success) =>
              emit(ResetPasswordSuccess(resetPasswordResponse: success)));
    });

    on<UpdatePasswordEvent>((event, emit) async {
      emit(UpdatePasswordLoading());

      final response =
          await _updatePasswordUseCase(event.updatePasswordRequest);

      response.fold(
          (f) => emit(
              const UpdatePasswordFailure(errorMessage: "UpdatePassword Fail")),
          (success) =>
              emit(UpdatePasswordSuccess(updatePasswordResponse: success)));
    });
  }
}
