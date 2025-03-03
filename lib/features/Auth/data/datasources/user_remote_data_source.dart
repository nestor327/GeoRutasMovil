import 'package:dio/dio.dart';
import 'package:georutasmovil/features/Auth/data/models/authorized_user_response_model.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_in_request.dart';

abstract class UserRemoteDataSource {
  Future<AuthorizedUserResponseModel> SingIn(UserSingInRequest request);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<AuthorizedUserResponseModel> SingIn(UserSingInRequest request) async {
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

    final AuthorizedUserResponseModel user =
        AuthorizedUserResponseModel.fromJson(resp);

    return user;
  }
}
