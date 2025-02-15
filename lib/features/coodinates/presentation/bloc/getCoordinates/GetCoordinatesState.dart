import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/coodinates/domain/entities/coordinate.dart';

sealed class GetCoordinatesState {}

final class GetcoordinatesInitial extends GetCoordinatesState {}

final class GetcoordinatesLoading extends GetCoordinatesState {}

final class GetcoordinatesSuccess extends GetCoordinatesState {
  final List<Coordinate> list;
  GetcoordinatesSuccess({required this.list});
}

final class GetCoordinatesBetweenTwoPointsState extends GetCoordinatesState {
  final List<Coordinate> list;
  GetCoordinatesBetweenTwoPointsState({required this.list});
}

final class GetCoordinatesBetweenTwoBusStopsState extends GetCoordinatesState {
  final List<Coordinate> list;
  GetCoordinatesBetweenTwoBusStopsState({required this.list});
}

final class GetCoordinatesFailure extends GetCoordinatesState {
  final Failure failure;
  GetCoordinatesFailure({required this.failure});
}
