import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_in_request.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';

class SingInUserUseCase {
  final UserRepository userRepository;

  SingInUserUseCase({required this.userRepository});

  Future<Either<Failure, AuthorizedUserResponse>> call(
      UserSingInRequest request) async {
    return userRepository.Login(request);
  }
}
