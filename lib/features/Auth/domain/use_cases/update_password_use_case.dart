import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_update_password_request.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';

class UpdatePasswordUseCase {
  final UserRepository userRepository;

  UpdatePasswordUseCase({required this.userRepository});

  Future<Either<Failure, bool>> call(UserUpdatePasswordRequest request) async {
    return userRepository.UpdatePassword(request);
  }
}
