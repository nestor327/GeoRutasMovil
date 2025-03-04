import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/data/datasources/user_local_data_source.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_reset_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_in_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_up_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_up_response.dart';
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
  Future<Either<Failure, AuthorizedUserResponse>> SingIn(
      UserSingInRequest request) async {
    try {
      final credentials = await userLocalDataSource.GetUserTokensCredential();

      if (credentials.Id.isNotEmpty) {
        //Aqui se refresca la autenticacion en caso que existan las credenciales
      }

      return Right(AuthorizedUserResponse.fromJson("json"));
    } on LocalFailure {
      return left(LocalFailure());
    } catch (err) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserSingUpResponse>> SingUp(
      UserSingUpRequest request) {
    // TODO: implement SingUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> UpdatePassword(
      UserUpdatePasswordRequest request) {
    // TODO: implement UpdatePassword
    throw UnimplementedError();
  }
}
