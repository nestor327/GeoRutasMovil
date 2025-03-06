import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/Refresh_token_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_reset_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_in_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_update_password_request.dart';

abstract class UserRepository {
  Future<Either<Failure, AuthorizedUserResponse>> RefreshToken(
      UserRefreshTokenRequest request);

  Future<Either<Failure, AuthorizedUserResponse>> SignIn(
      UserSignInRequest request);

  Future<Either<Failure, UserSignUpResponse>> SignUp(UserSignUpRequest request);

  Future<Either<Failure, bool>> ResetPassword(UserResetPasswordRequest request);

  Future<Either<Failure, bool>> UpdatePassword(
      UserUpdatePasswordRequest request);
}
