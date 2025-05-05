part of 'route_locations_bloc.dart';

class RouteLocationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetOriginCoordinates extends RouteLocationEvent {
  final double lat;
  final double lng;

  SetOriginCoordinates({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}

class SetDestinationCoordinates extends RouteLocationEvent {
  final double lat;
  final double lng;

  SetDestinationCoordinates({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
