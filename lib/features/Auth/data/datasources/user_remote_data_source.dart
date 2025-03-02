import 'package:georutasmovil/features/Auth/data/models/authorized_user_response_model.dart';

abstract class UserRemoteDataSource {
  Future<AuthorizedUserResponseModel> SingIn();
}
