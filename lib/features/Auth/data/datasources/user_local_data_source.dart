import 'dart:convert';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/data/models/user_token_credentials_model.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_token_credentials.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class UserLocalDataSource {
  //Aqui prevaleceran los datos del usaurio en el tiempo
  Future<bool> SetUserTokensCredential(UserTokenCredentialsModel credentials);

  Future<UserTokenCredentialsModel> GetUserTokensCredential();
}

class HiveUserLocalDataSourceImpl implements UserLocalDataSource {
  HiveUserLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<UserTokenCredentialsModel> GetUserTokensCredential() async {
    try {
      Box<String> box = await Hive.openBox("userTokens");

      return UserTokenCredentialsModel.fromJson(box.get("userCredentials"));
    } catch (error) {
      return Future.error(LocalFailure());
    }
  }

  @override
  Future<bool> SetUserTokensCredential(UserTokenCredentials credentials) async {
    try {
      Box<String> box = await Hive.openBox("userTokens");

      box.put(
          "userCredentials",
          jsonEncode(UserTokenCredentialsModel.fromEntity(credentials)
              .toJson()
              .toString()));
      return true;
    } catch (error) {
      return Future.error(LocalFailure());
    }
  }
}
