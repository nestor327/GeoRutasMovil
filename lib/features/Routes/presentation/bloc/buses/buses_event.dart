import 'package:equatable/equatable.dart';

abstract class BusesEvent extends Equatable {
  const BusesEvent();

  @override
  List<Object?> get props => [];
}

class CargarBuses extends BusesEvent {
  final String tipoBusqueda;

  const CargarBuses(this.tipoBusqueda);

  @override
  List<Object?> get props => [tipoBusqueda];
}

class SetShowSearchBusField extends BusesEvent {
  final bool showSearchBusField;
  const SetShowSearchBusField(this.showSearchBusField);

  @override
  List<Object?> get props => [showSearchBusField];
}

class SetShowSearchBusLocationFieldEvent extends BusesEvent {
  final bool showSearchBusLocationField;
  const SetShowSearchBusLocationFieldEvent(this.showSearchBusLocationField);

  @override
  List<Object?> get props => [showSearchBusLocationField];
}

class SetShowBusStopsLocationFieldEvent extends BusesEvent {
  final bool setShowBusStopsLocationFieldRight;
  final bool setShowBusStopsLocationFieldLeft;
  const SetShowBusStopsLocationFieldEvent(
      this.setShowBusStopsLocationFieldRight,
      this.setShowBusStopsLocationFieldLeft);

  @override
  List<Object?> get props =>
      [setShowBusStopsLocationFieldRight, setShowBusStopsLocationFieldLeft];
}
