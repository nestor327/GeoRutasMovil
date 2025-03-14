import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/data/datasources/user_local_data_source.dart';
import 'package:georutasmovil/features/Auth/data/models/user_token_credentials_model.dart';
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
      UserResetPasswordRequest request) async {
    try {
      final response = await userRemoteDataSource.ResetPassword(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
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
      UserSignUpRequest request) async {
    try {
      final response = await userRemoteDataSource.SignUp(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> UpdatePassword(
      UserUpdatePasswordRequest request) async {
    try {
      final response = await userRemoteDataSource.UpdatePassword(request);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
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

  @override
  Future<Either<Failure, UserTokenCredentialsModel>>
      GetUserTokensCredential() async {
    try {
      final response = await userLocalDataSource.GetUserTokensCredential();
      return response.fold(
          (_) => left(ServerFailure()), (tokens) => Right(tokens));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> SetUserTokensCredential(
      UserTokenCredentialsModel credentials) async {
    try {
      final response =
          await userLocalDataSource.SetUserTokensCredential(credentials);
      return response.fold(
          (_) => left(ServerFailure()), (credentials) => Right(credentials));
    } catch (err) {
      return left(LocalFailure());
    }
  }
}
