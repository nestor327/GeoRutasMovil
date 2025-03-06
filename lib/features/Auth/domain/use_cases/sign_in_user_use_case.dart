import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_in_request.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';

class SignInUserUseCase {
  final UserRepository userRepository;

  SignInUserUseCase({required this.userRepository});

  Future<Either<Failure, AuthorizedUserResponse>> call(
      UserSignInRequest request) async {
    return userRepository.SignIn(request);
  }
}
