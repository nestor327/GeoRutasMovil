import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/data/models/google_auto_complete_response_model.dart';
import 'package:georutasmovil/shared/utils/env.dart';

abstract class GooglePlaceDataSource {
  Future<Either<Failure, GoogleAutoCompleteResponseModel>> findCity(
      String city, String language, String sesionToken);

  Future<Either<Failure, GoogleAutoCompleteResponseModel>> detailResponse(
      String city, String language, String sesionToken);
}

class GooglePlaceDataSourceImpl implements GooglePlaceDataSource {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, GoogleAutoCompleteResponseModel>> detailResponse(
      String city, String language, String sesionToken) async {
    try {
      final resp = await dio.post(
        'http://192.168.1.14:5000/v1/auth/login',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'input': city,
          'sesiontoken': sesionToken,
          'types': '(cities)',
          'language': language,
          'key': EnvConfig.geoRutasApyKey
        },
      );

      if (resp.statusCode == 200) {
        final GoogleAutoCompleteResponseModel response =
            GoogleAutoCompleteResponseModel.fromJson(resp.data);
        return Right(response);
      } else {
        return Left(ServerFailure());
      }
    } catch (Error) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, GoogleAutoCompleteResponseModel>> findCity(
      String city, String language, String sesionToken) {
    // TODO: implement findCity
    throw UnimplementedError();
  }
}
