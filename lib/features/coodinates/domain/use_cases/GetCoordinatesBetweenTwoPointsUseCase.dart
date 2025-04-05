import 'package:dartz/dartz.dart';
import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/coodinates/domain/entities/Coordinate.dart';
import 'package:georutasmovil/features/coodinates/domain/repositories/CoordinateRepository.dart';

class GetCoordinatesBetweenTwoPointsUseCase {
  final CoordinateRepository repository;

  GetCoordinatesBetweenTwoPointsUseCase({required this.repository});

  Future<Either<Failure, List<CoordinateLocal>>> call(double firstLatitude,
      double secondLatitude, double firstLongitude, double secondLongitude) {
    //Se ejecuta inmediatamente luego de realizar la instancia de la clase.
    return repository.getCoordinatesBetweenTwoPoints(
        firstLatitude, secondLatitude, firstLongitude, secondLongitude);
  }
}
