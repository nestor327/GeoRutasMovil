import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus_type.dart';

abstract class GeoRutasRepository {
  Future<Either<Failure, List<BusType>>> GetBusesByType();
  Future<Either<Failure, List<BusType>>> GetBusTypes();
}
