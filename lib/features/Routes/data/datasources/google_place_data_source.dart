import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/data/models/google_auto_complete_response_model.dart';

abstract class GooglePlaceDataSource {
  Future<Either<Failure, GoogleAutoCompleteResponseModel>> findCity(
      String city, String language, String sesionToken);

  Future<Either<Failure, GoogleAutoCompleteResponseModel>> detailResponse(
      String city, String language, String sesionToken);
}

class GooglePlaceDataSourceImpl implements GooglePlaceDataSource {
  @override
  Future<Either<Failure, GoogleAutoCompleteResponseModel>> detailResponse(
      String city, String language, String sesionToken) {
    // TODO: implement detailResponse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GoogleAutoCompleteResponseModel>> findCity(
      String city, String language, String sesionToken) {
    // TODO: implement findCity
    throw UnimplementedError();
  }
}
