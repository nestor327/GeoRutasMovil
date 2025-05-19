import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_by_bus_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_coordinates_by_bus_id_use_case.dart';

part 'route_location_event.dart';
part 'route_location_state.dart';

class RouteLocationBloc extends Bloc<RouteLocationEvent, RouteLogState> {
  final GetCoordinatesByBusIdUseCase _getCoordinatesByBusIdUseCase;

  RouteLocationBloc(this._getCoordinatesByBusIdUseCase)
      : super(const RouteLocationInit()) {
    on<SetOriginCoordinates>((event, emit) {
      emit(RouteLocationState(originLat: event.lat, originLng: event.lng));
    });

    on<SetDestinationCoordinates>((event, emit) {
      emit(RouteLocationState(
          destinationLat: event.lat, destinationLng: event.lng));
    });

    on<GetCoodintateRouteByBusIdEvent>((event, emit) async {
      try {
        emit(const GetCoordinateRouteByBusIdLoading());

        print("Entro a la funcion event del bloc");

        final coodinates = await _getCoordinatesByBusIdUseCase(event.request);

        coodinates.fold(
            (_) => emit(const GetCoordinateRouteByBusIdError(
                error: "Get coodinates fail")),
            (reset) =>
                emit(GetCoordinateRouteByBusIdLoaded(coordinates: reset)));
      } catch (Error) {
        print("Ocurrio un error");
        emit(GetCoordinateRouteByBusIdError(error: Error.toString()));
      }
    });
  }
}
