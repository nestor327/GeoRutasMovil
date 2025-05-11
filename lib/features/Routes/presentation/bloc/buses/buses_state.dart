import 'package:equatable/equatable.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';

abstract class BusesState extends Equatable {
  const BusesState();

  @override
  List<Object?> get props => [];
}

class BusesInicial extends BusesState {}

class BusesCargando extends BusesState {}

class BusesCargados extends BusesState {
  final String tipoBusqueda;
  final List<Bus> buses;

  const BusesCargados({required this.tipoBusqueda, required this.buses});

  @override
  List<Object?> get props => [tipoBusqueda, buses];
}

class BusesError extends BusesState {
  final String mensaje;

  const BusesError(this.mensaje);

  @override
  List<Object?> get props => [mensaje];
}
