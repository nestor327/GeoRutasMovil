import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/data/models/user_token_credentials_model.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class UserLocalDataSource {
  Future<Either<Failure, bool>> SetUserTokensCredential(
      UserTokenCredentialsModel credentials);

  Future<Either<Failure, UserTokenCredentialsModel>> GetUserTokensCredential();
}

class HiveUserLocalDataSourceImpl implements UserLocalDataSource {
  HiveUserLocalDataSourceImpl() {
    // Hive.initFlutter();
  }

  @override
  Future<Either<Failure, bool>> SetUserTokensCredential(
      AuthorizedUserResponse credentials) async {
    try {
      Box<String> box = await Hive.openBox("userTokens");

      box.clear();
      box.put(
          "userCredentials",
          jsonEncode(
              UserTokenCredentialsModel.fromEntity(credentials).toJson()));

      return right(true);
    } catch (error) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, UserTokenCredentialsModel>>
      GetUserTokensCredential() async {
    try {
      Box<String> box = await Hive.openBox("userTokens");

      return Right(UserTokenCredentialsModel.fromJson(
          jsonDecode(box.get("userCredentials")!)));
    } catch (error) {
      return left(LocalFailure());
    }
  }
}
