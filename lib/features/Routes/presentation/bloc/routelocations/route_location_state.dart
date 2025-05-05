part of 'route_locations_bloc.dart';

class RouteLocationState extends Equatable {
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
