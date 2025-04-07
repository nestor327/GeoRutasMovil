part of 'route_bloc.dart';

sealed class RouteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetBusesByTypeEvent extends RouteEvent {
  final GetBusesByTypeRequest request;

  GetBusesByTypeEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetBusTypesEvent extends RouteEvent {
  GetBusTypesEvent();

  @override
  List<Object> get props => [];
}

class GetBusesByNameEvent extends RouteEvent {
  final GetBusesByNameRequest request;

  GetBusesByNameEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetBusesByLocationEvent extends RouteEvent {
  final GetBusesByLocationRequest request;

  GetBusesByLocationEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetCoordinateRouteByScheduleIdEvent extends RouteEvent {
  final GetCoordinateRoutesByScheduleIdRequest request;

  GetCoordinateRouteByScheduleIdEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetCoordinatesBetweenStopsEvent extends RouteEvent {
  final GetCoordinatesBetweenStopsRequest request;

  GetCoordinatesBetweenStopsEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetScheduleByBusIdAndWeekDayAndTimeEvent extends RouteEvent {
  final GetScheduleByBusIdWeekDayAndHourRequest request;

  GetScheduleByBusIdAndWeekDayAndTimeEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetStopsByRangeEvent extends RouteEvent {
  final GetStopByRangeRequest request;

  GetStopsByRangeEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetStopsByScheduleIdEvent extends RouteEvent {
  final GetStopByScheduleIdRequest request;

  GetStopsByScheduleIdEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class GetTripsByLocationEvent extends RouteEvent {
  final GetTripsByLocationRequest request;

  GetTripsByLocationEvent({required this.request});

  @override
  List<Object> get props => [request];
}
