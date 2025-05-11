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
