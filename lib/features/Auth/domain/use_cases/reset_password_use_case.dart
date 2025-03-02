import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_reset_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';

class ResetPasswordUseCase {
  final UserRepository userRepository;

  ResetPasswordUseCase({required this.userRepository});

  Future<Either<Failure, bool>> call(UserResetPasswordRequest request) async {
    return userRepository.ResetPassword(request);
  }
}
