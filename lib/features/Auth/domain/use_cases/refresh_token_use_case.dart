import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Auth/domain/entities/Refresh_token_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/authorized_user_response.dart';
import 'package:georutasmovil/features/Auth/domain/repositories/user_repository.dart';

class RefreshTokenUseCase {
  final UserRepository userRepository;

  RefreshTokenUseCase({required this.userRepository});

  Future<Either<Failure, AuthorizedUserResponse>> call(
      UserRefreshTokenRequest request) async {
    return userRepository.RefreshToken(request);
  }
}
