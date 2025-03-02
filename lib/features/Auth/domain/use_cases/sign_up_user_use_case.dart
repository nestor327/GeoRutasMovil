import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_up_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sing_up_response.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';

class SignUpUserUseCase {
  final UserRepository userRepository;

  SignUpUserUseCase(this.userRepository);

  Future<Either<Failure, UserSingUpResponse>> call(
      UserSingUpRequest request) async {
    return await userRepository.SingUp(request);
  }
}
