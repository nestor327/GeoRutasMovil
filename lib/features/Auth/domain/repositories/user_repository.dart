import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_reset_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_in_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_up_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_up_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_update_password_request.dart';

abstract class UserRepository {
  Future<Either<Failure, AuthorizedUserResponse>> Login(
      UserSingInRequest request);

  Future<Either<Failure, UserSingUpResponse>> SingUp(UserSingUpRequest request);

  Future<Either<Failure, bool>> ResetPassword(UserResetPasswordRequest request);

  Future<Either<Failure, bool>> UpdatePassword(
      UserUpdatePasswordRequest request);
}
