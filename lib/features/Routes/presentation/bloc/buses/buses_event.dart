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

class SetShowSearchBusLocationField extends BusesEvent {
  final bool showSearchBusLocationField;
  const SetShowSearchBusLocationField(this.showSearchBusLocationField);

  @override
  List<Object?> get props => [showSearchBusLocationField];
}
