import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/data/datasources/georutas_api_data_source.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus_type.dart';
import 'package:georutasmovil/features/Routes/domain/repositories/georutas_repository.dart';

class GeorutasRepositoryImpl implements GeoRutasRepository {
  final GeoRutasApiDataSource geoRutasApiDataSource;

  GeorutasRepositoryImpl({required this.geoRutasApiDataSource});

  @override
  Future<Either<Failure, List<BusType>>> GetBusesByType() async {
    try {
      final response = await geoRutasApiDataSource.GetBusesByType();

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<BusType>>> GetBusTypes() async {
    try {
      final response = await geoRutasApiDataSource.GetBusTypes();

      return response.fold(
          (_) => left(ServerFailure()), (reset) => Right(reset));
    } catch (err) {
      return left(LocalFailure());
    }
  }
}
