part of 'route_locations_bloc.dart';

abstract class RouteLogState extends Equatable {
  const RouteLogState();

  @override
  List<Object?> get props => [];
}

class RouteLocationState extends RouteLogState {
  final double? originLat;
  final double? originLng;
  final double? destinationLat;
  final double? destinationLng;

  const RouteLocationState({
    this.originLat,
    this.originLng,
    this.destinationLat,
    this.destinationLng,
  });

  RouteLocationState copyWith({
    double? originLat,
    double? originLng,
    double? destinationLat,
    double? destinationLng,
  }) {
    return RouteLocationState(
      originLat: originLat ?? this.originLat,
      originLng: originLng ?? this.originLng,
      destinationLat: destinationLat ?? this.destinationLat,
      destinationLng: destinationLng ?? this.destinationLng,
    );
  }

  @override
  List<Object?> get props =>
      [originLat, originLng, destinationLat, destinationLng];
}

class RouteLocationInit extends RouteLogState {
  const RouteLocationInit();

  @override
  List<Object?> get props => [];
}

class GetCoordinateRouteByBusIdLoaded extends RouteLogState {
  final List<Coordinate?> coordinates;

  const GetCoordinateRouteByBusIdLoaded({required this.coordinates});

  @override
  List<Object?> get props => [coordinates];
}

class GetCoordinateRouteByBusIdLoading extends RouteLogState {
  const GetCoordinateRouteByBusIdLoading();

  @override
  List<Object?> get props => [];
}

class GetCoordinateRouteByBusIdError extends RouteLogState {
  final String error;

  const GetCoordinateRouteByBusIdError({required this.error});

  @override
  List<Object?> get props => [error];
}
