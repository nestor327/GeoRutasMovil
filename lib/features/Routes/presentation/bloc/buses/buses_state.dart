import 'package:equatable/equatable.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';

abstract class BusesState extends Equatable {
  const BusesState();

  @override
  List<Object?> get props => [];
}

class ShowSearchBusFieldLoaded extends BusesState {
  final bool? showAutoCompleteBusName;

  const ShowSearchBusFieldLoaded({required this.showAutoCompleteBusName});

  @override
  List<Object?> get props => [showAutoCompleteBusName];
}

class ShowSearchBusFieldLoading extends BusesState {
  const ShowSearchBusFieldLoading();

  @override
  List<Object?> get props => [];
}

class ShowSearchLocationBusFieldLoaded extends BusesState {
  final bool? showAutoCompleteBusLocation;

  const ShowSearchLocationBusFieldLoaded(
      {required this.showAutoCompleteBusLocation});

  @override
  List<Object?> get props => [showAutoCompleteBusLocation];
}

class ShowSearchLocationBusFieldLoading extends BusesState {
  const ShowSearchLocationBusFieldLoading();

  @override
  List<Object?> get props => [];
}

class SetShowSearchBusStopLocationFieldLoaded extends BusesState {
  final bool? SetShowSearchBusLocationFieldRight;
  final bool? SetShowSearchBusLocationFieldLeft;

  const SetShowSearchBusStopLocationFieldLoaded(
      {required this.SetShowSearchBusLocationFieldLeft,
      required this.SetShowSearchBusLocationFieldRight});

  @override
  List<Object?> get props =>
      [SetShowSearchBusLocationFieldLeft, SetShowSearchBusLocationFieldRight];
}

class SetShowSearchBusStopLocationFieldLoading extends BusesState {
  const SetShowSearchBusStopLocationFieldLoading();

  @override
  List<Object?> get props => [];
}

class BusesInicial extends BusesState {
  const BusesInicial();
}

class BusesLoading extends BusesState {
  const BusesLoading();
}

class BusesLoaded extends BusesState {
  final String tipoBusqueda;
  final List<Bus> buses;

  const BusesLoaded({required this.tipoBusqueda, required this.buses});

  @override
  List<Object?> get props => [tipoBusqueda, buses];
}

class BusesError extends BusesState {
  final String mensaje;

  const BusesError(this.mensaje);

  @override
  List<Object?> get props => [mensaje];
}

class SetShowSearchLoaded extends BusesState {
  const SetShowSearchLoaded();

  @override
  List<Object?> get props => [];
}
