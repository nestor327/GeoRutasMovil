import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/data/models/authorized_user_response_model.dart';
import 'package:georutasmovil/features/Auth/data/models/user_sign_up_response_model.dart';
import 'package:georutasmovil/features/Auth/domain/entities/Refresh_token_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_reset_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_in_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_up_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_update_password_request.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, AuthorizedUserResponseModel>> RefreshToken(
      UserRefreshTokenRequest request);
  Future<Either<Failure, AuthorizedUserResponseModel>> SignIn(
      UserSignInRequest request);
  Future<Either<Failure, UserSignUpResponseModel>> SignUp(
      UserSignUpRequest request);
  Future<Either<Failure, bool>> ResetPassword(UserResetPasswordRequest request);
  Future<Either<Failure, bool>> UpdatePassword(
      UserUpdatePasswordRequest request);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, AuthorizedUserResponseModel>> SignIn(
      UserSignInRequest request) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
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
        'http://192.168.1.14:5000/v1/auth/refresh-token',
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

  @override
  Future<Either<Failure, bool>> ResetPassword(
      UserResetPasswordRequest request) async {
    try {
      final resetPassword = await dio.post(
        'http://192.168.1.14:5000/v1/auth/reset-password',
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

      if (resetPassword.statusCode == 200) {
        return Right(true);
      } else {
        return Left(ServerFailure());
      }
    } catch (error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, UserSignUpResponseModel>> SignUp(
      UserSignUpRequest request) async {
    try {
      final signUpResponse = await dio.post(
        'http://192.168.1.14:5000/v1/account/users',
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
          'firstName': request.FirstName,
          'lastName': request.LastName,
          'cityId': request.CityId,
          'timeZoneId': request.TimeZoneId,
          'userImageUrl': request.UserImageUrl,
          'languageId': request.LanguageId,
        },
      );

      if (signUpResponse.statusCode == 200) {
        return Right(UserSignUpResponseModel.fromJson(signUpResponse.data));
      } else {
        return Left(ServerFailure());
      }
    } catch (error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> UpdatePassword(
      UserUpdatePasswordRequest request) async {
    try {
      final updatePassword = await dio.put(
        'http://192.168.1.14:5000/v1/auth/update-password',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'currentPassword': request.CurrentPassword,
          'newPassword': request.NewPassword,
        },
      );

      if (updatePassword.statusCode == 200) {
        return Right(true);
      } else {
        return Left(ServerFailure());
      }
    } catch (error) {
      return Left(LocalFailure());
    }
  }
}
