import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/data/datasources/google_place_data_source.dart';
import 'package:georutasmovil/features/Routes/domain/entities/google_auto_complete_response.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/google_place_repository.dart';

class GooglePlaceRepositoryImpl implements GooglePlaceRepository {
  final GooglePlaceDataSource googlePlaceDataSource;

  GooglePlaceRepositoryImpl({required this.googlePlaceDataSource});

  @override
  Future<Either<Failure, GoogleAutoCompleteResponse>> detailResponse(
      String city, String language, String sesionToken) async {
    try {
      final response = await googlePlaceDataSource.detailResponse(
          city, language, sesionToken);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, GoogleAutoCompleteResponse>> findCity(
      String city, String language, String sesionToken) async {
    try {
      final response =
          await googlePlaceDataSource.findCity(city, language, sesionToken);

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }
}
