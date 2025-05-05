import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'route_location_event.dart';
part 'route_location_state.dart';

class RouteLocationBloc extends Bloc<RouteLocationEvent, RouteLocationState> {
  RouteLocationBloc() : super(const RouteLocationState()) {
    on<SetOriginCoordinates>((event, emit) {
      emit(state.copyWith(
        originLat: event.lat,
        originLng: event.lng,
      ));
    });

    on<SetDestinationCoordinates>((event, emit) {
      emit(state.copyWith(
        destinationLat: event.lat,
        destinationLng: event.lng,
      ));
    });
  }
}
