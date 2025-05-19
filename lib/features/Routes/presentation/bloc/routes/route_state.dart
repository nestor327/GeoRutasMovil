part of 'route_bloc.dart';

sealed class RouteState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RouteInitial extends RouteState {}

final class GetBusesByTypeLoading extends RouteState {}

final class GetBusesByTypeSuccess extends RouteState {
  final List<Bus> response;
  GetBusesByTypeSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetBusesByTypeFailure extends RouteState {
  final String errorMessage;
  GetBusesByTypeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetBusTypesLoading extends RouteState {}

final class GetBusTypesSuccess extends RouteState {
  final List<BusType> response;
  GetBusTypesSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetBusTypesFailure extends RouteState {
  final String errorMessage;
  GetBusTypesFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetBusesByNameLoading extends RouteState {}

final class GetBusesByNameSuccess extends RouteState {
  final List<Bus> response;
  GetBusesByNameSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetBusesByNameFailure extends RouteState {
  final String errorMessage;
  GetBusesByNameFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetBusesByLocationLoading extends RouteState {}

final class GetBusesByLocationSuccess extends RouteState {
  final List<Bus> buses;
  GetBusesByLocationSuccess({required this.buses});
  @override
  List<Object> get props => [buses];
}

final class GetBusesByLocationFailure extends RouteState {
  final String errorMessage;
  GetBusesByLocationFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetCoordinateRouteByScheduleIdLoading extends RouteState {}

final class GetCoordinateRouteByScheduleIdSuccess extends RouteState {
  final List<Coordinate> response;
  GetCoordinateRouteByScheduleIdSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetCoordinateRouteByScheduleIdFailure extends RouteState {
  final String errorMessage;
  GetCoordinateRouteByScheduleIdFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetCoordinatesBetweenStopsLoading extends RouteState {}

final class GetCoordinatesBetweenStopsSuccess extends RouteState {
  final List<Coordinate> response;
  GetCoordinatesBetweenStopsSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetCoordinatesBetweenStopsFailure extends RouteState {
  final String errorMessage;
  GetCoordinatesBetweenStopsFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetScheduleByBusIdAndWeekDayAndTimeLoading extends RouteState {}

final class GetScheduleByBusIdAndWeekDayAndTimeSuccess extends RouteState {
  final Schedule response;
  GetScheduleByBusIdAndWeekDayAndTimeSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetScheduleByBusIdAndWeekDayAndTimeFailure extends RouteState {
  final String errorMessage;
  GetScheduleByBusIdAndWeekDayAndTimeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetStopsByRangeLoading extends RouteState {}

final class GetStopsByRangeSuccess extends RouteState {
  final List<Stop> response;
  GetStopsByRangeSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetStopsByRangeFailure extends RouteState {
  final String errorMessage;
  GetStopsByRangeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetStopsByScheduleIdLoading extends RouteState {}

final class GetStopsByScheduleIdSuccess extends RouteState {
  final List<Stop> response;
  GetStopsByScheduleIdSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetStopsByScheduleIdFailure extends RouteState {
  final String errorMessage;
  GetStopsByScheduleIdFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetTripsByLocationLoading extends RouteState {}

final class GetTripsByLocationSuccess extends RouteState {
  final TripPaginated response;
  GetTripsByLocationSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class GetTripsByLocationFailure extends RouteState {
  final String errorMessage;
  GetTripsByLocationFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
