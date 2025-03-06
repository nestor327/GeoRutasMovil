import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/data/models/authorized_user_response_model.dart';
import 'package:georutasmovil/features/Auth/domain/entities/Refresh_token_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_in_request.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, AuthorizedUserResponseModel>> RefreshToken(
      UserRefreshTokenRequest request);
  Future<Either<Failure, AuthorizedUserResponseModel>> SignIn(
      UserSignInRequest request);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, AuthorizedUserResponseModel>> SignIn(
      UserSignInRequest request) async {
    try {
      final resp = await dio.post(
        'https://localhost:5001/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'email': request.Email,
          'password': request.Password,
        },
      );

      if (resp.statusCode == 200) {
        final AuthorizedUserResponseModel user =
            AuthorizedUserResponseModel.fromJson(resp.data);

        return Right(user);
      } else {
        return Left(ServerFailure());
      }
    } catch (error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, AuthorizedUserResponseModel>> RefreshToken(
      UserRefreshTokenRequest request) async {
    try {
      final refrehLogin = await dio.post(
        'https://localhost:5001/v1/auth/refresh-token',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'accessToken': request.AccessToken,
          'refreshToken': request.RefreshToken,
        },
      );

      if (refrehLogin.statusCode == 200) {
        return Right(AuthorizedUserResponseModel.fromJson(refrehLogin.data));
      } else {
        return Left(ServerFailure());
      }
    } catch (error) {
      return Left(LocalFailure());
    }
  }
}
