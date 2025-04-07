import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus_type.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_name_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_type_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_routes_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinates_between_stops_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_schedule_by_bus_id_week_day_and_hour_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_range_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_trips_by_location_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/schedule.dart';
import 'package:georutasmovil/features/Routes/domain/entities/stop.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip_paginated.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_bus_by_location_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_bus_by_name_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_bus_types_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_buses_by_type_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_coordinate_routes_by_schedule_id_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_coordinates_between_stops_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_schedule_by_bus_id_and_week_day_and_time_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_stop_by_range_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_stops_by_schedule_id_use_case.dart';
import 'package:georutasmovil/features/Routes/domain/use_cases/get_trips_by_location_use_case.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final GetBusesByTypeUseCase _getBusesByTypeUseCase;
  final GetBusTypesUseCase _getBusTypesUseCase;
  final GetBusesByNameUseCase _getBusesByNameUseCase;
  final GetBusByLocationUseCase _getBusByLocationUseCase;
  final GetCoordinateRoutesByScheduleIdUseCase
      _getCoordinateRoutesByScheduleIdUseCase;
  final GetCoordinatesBetweenStopsUseCase _getCoordinatesBetweenStopsUseCase;
  final GetScheduleByBusIdAndWeekDayAndTimeUseCase
      _getScheduleByBusIdAndWeekDayAndTimeUseCase;
  final GetStopByRangeUseCase _getStopByRangeUseCase;
  final GetStopsByScheduleIdUseCase _getStopsByScheduleIdUseCase;
  final GetTripsByLocationUseCase _getTripsByLocationUseCase;

  RouteBloc(
      this._getBusesByTypeUseCase,
      this._getBusTypesUseCase,
      this._getBusesByNameUseCase,
      this._getBusByLocationUseCase,
      this._getCoordinateRoutesByScheduleIdUseCase,
      this._getCoordinatesBetweenStopsUseCase,
      this._getScheduleByBusIdAndWeekDayAndTimeUseCase,
      this._getStopByRangeUseCase,
      this._getStopsByScheduleIdUseCase,
      this._getTripsByLocationUseCase)
      : super(RouteInitial()) {
    on<GetBusesByTypeEvent>((event, emit) async {
      emit(GetBusesByTypeLoading());

      final response = await _getBusesByTypeUseCase(event.request);

      response.fold(
          (f) => emit(GetBusesByTypeFailure(errorMessage: "SignUp Fail")),
          (success) => emit(GetBusesByTypeSuccess(response: success)));
    });

    on<GetBusTypesEvent>((event, emit) async {
      emit(GetBusTypesLoading());

      final response = await _getBusTypesUseCase();

      response.fold(
          (f) => emit(GetBusTypesFailure(errorMessage: "SignUp Fail")),
          (success) => emit(GetBusTypesSuccess(response: success)));
    });

    on<GetBusesByNameEvent>((event, emit) async {
      emit(GetBusesByNameLoading());

      final response = await _getBusesByNameUseCase(event.request);

      response.fold(
          (f) => emit(GetBusesByNameFailure(errorMessage: "SignUp Fail")),
          (success) => emit(GetBusesByNameSuccess(response: success)));
    });

    on<GetBusesByLocationEvent>((event, emit) async {
      emit(GetBusesByLocationLoading());

      final response = await _getBusByLocationUseCase(event.request);

      response.fold(
          (f) => emit(GetBusesByLocationFailure(errorMessage: "SignUp Fail")),
          (success) => emit(GetBusesByLocationSuccess(response: success)));
    });

    on<GetCoordinateRouteByScheduleIdEvent>((event, emit) async {
      emit(GetCoordinateRouteByScheduleIdLoading());

      final response =
          await _getCoordinateRoutesByScheduleIdUseCase(event.request);

      response.fold(
          (f) => emit(GetCoordinateRouteByScheduleIdFailure(
              errorMessage: "SignUp Fail")),
          (success) =>
              emit(GetCoordinateRouteByScheduleIdSuccess(response: success)));
    });

    on<GetCoordinatesBetweenStopsEvent>((event, emit) async {
      emit(GetCoordinatesBetweenStopsLoading());

      final response = await _getCoordinatesBetweenStopsUseCase(event.request);

      response.fold(
          (f) => emit(
              GetCoordinatesBetweenStopsFailure(errorMessage: "SignUp Fail")),
          (success) =>
              emit(GetCoordinatesBetweenStopsSuccess(response: success)));
    });

    on<GetScheduleByBusIdAndWeekDayAndTimeEvent>((event, emit) async {
      emit(GetScheduleByBusIdAndWeekDayAndTimeLoading());

      final response =
          await _getScheduleByBusIdAndWeekDayAndTimeUseCase(event.request);

      response.fold(
          (f) => emit(GetScheduleByBusIdAndWeekDayAndTimeFailure(
              errorMessage: "SignUp Fail")),
          (success) => emit(
              GetScheduleByBusIdAndWeekDayAndTimeSuccess(response: success)));
    });

    on<GetStopsByRangeEvent>((event, emit) async {
      emit(GetStopsByRangeLoading());

      final response = await _getStopByRangeUseCase(event.request);

      response.fold(
          (f) => emit(GetStopsByRangeFailure(errorMessage: "SignUp Fail")),
          (success) => emit(GetStopsByRangeSuccess(response: success)));
    });

    on<GetStopsByScheduleIdEvent>((event, emit) async {
      emit(GetStopsByScheduleIdLoading());

      final response = await _getStopsByScheduleIdUseCase(event.request);

      response.fold(
          (f) => emit(GetStopsByScheduleIdFailure(errorMessage: "SignUp Fail")),
          (success) => emit(GetStopsByScheduleIdSuccess(response: success)));
    });

    on<GetTripsByLocationEvent>((event, emit) async {
      emit(GetTripsByLocationLoading());

      final response = await _getTripsByLocationUseCase(event.request);

      response.fold(
          (f) => emit(GetTripsByLocationFailure(errorMessage: "SignUp Fail")),
          (success) => emit(GetTripsByLocationSuccess(response: success)));
    });
  }
}
