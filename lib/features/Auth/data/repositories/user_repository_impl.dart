import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/data/datasources/user_local_data_source.dart';
import 'package:georutasmovil/features/Auth/domain/entities/Refresh_token_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_reset_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_in_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_update_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';

import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl(
      {required this.userLocalDataSource, required this.userRemoteDataSource});

  @override
  Future<Either<Failure, bool>> ResetPassword(
      UserResetPasswordRequest request) {
    // TODO: implement ResetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthorizedUserResponse>> SignIn(
      UserSignInRequest request) async {
    try {
      final response = await userRemoteDataSource.SignIn(request);

      return response.fold((_) => left(ServerFailure()), (auth) => Right(auth));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, UserSignUpResponse>> SignUp(
      UserSignUpRequest request) {
    // TODO: implement SignUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> UpdatePassword(
      UserUpdatePasswordRequest request) {
    // TODO: implement UpdatePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthorizedUserResponse>> RefreshToken(
      UserRefreshTokenRequest request) async {
    try {
      final response = await userRemoteDataSource.RefreshToken(request);

      return response.fold(
          (_) => left(ServerFailure()), (refresh) => Right(refresh));
    } catch (err) {
      return left(LocalFailure());
    }
  }
}
