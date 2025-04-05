import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/coodinates/domain/entities/Coordinate.dart';
import 'package:georutasmovil/features/coodinates/domain/repositories/CoordinateRepository.dart';

class GetCoordinatesBetweenTwoBusStopsUseCase {
  final CoordinateRepository repository;

  GetCoordinatesBetweenTwoBusStopsUseCase({required this.repository});

  Future<Either<Failure, List<CoordinateLocal>>> call(
      int firstBusStopId, double secondBusStopId) {
    //Se ejecuta inmediatamente luego de realizar la instancia de la clase.

    return repository.getCoordinatesBetweenTwoBusStops(
        firstBusStopId, secondBusStopId);
  }
}
