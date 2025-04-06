import 'package:georutasmovil/core/error/Failure.dart';
import 'package:georutasmovil/features/coodinates/domain/entities/Coordinate.dart';

sealed class GetCoordinateLocalsState {}

final class GetCoordinateLocalsInitial extends GetCoordinateLocalsState {}

final class GetCoordinateLocalsLoading extends GetCoordinateLocalsState {}

final class GetCoordinateLocalsSuccess extends GetCoordinateLocalsState {
  final List<CoordinateLocal> list;
  GetCoordinateLocalsSuccess({required this.list});
}

final class GetCoordinateLocalsBetweenTwoPointsState
    extends GetCoordinateLocalsState {
  final List<CoordinateLocal> list;
  GetCoordinateLocalsBetweenTwoPointsState({required this.list});
}

final class GetCoordinateLocalsBetweenTwoBusStopsState
    extends GetCoordinateLocalsState {
  final List<CoordinateLocal> list;
  GetCoordinateLocalsBetweenTwoBusStopsState({required this.list});
}

final class GetCoordinateLocalsFailure extends GetCoordinateLocalsState {
  final Failure failure;
  GetCoordinateLocalsFailure({required this.failure});
}
