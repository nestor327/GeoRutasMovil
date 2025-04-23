import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/google_auto_complete_response.dart';

abstract class GooglePlaceRepository {
  Future<Either<Failure, GoogleAutoCompleteResponse>> findCity(
      String city, String language, String sesionToken);

  Future<Either<Failure, GoogleAutoCompleteResponse>> detailResponse(
      String city, String language, String sesionToken);
}
