import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/app_user.dart';

abstract class UserRepository {
  Future<Either<Failure, AppUser>> Login(String userName, String password);

  Future<Either<Failure, AppUser>> SingUp(AppUser user);
}
