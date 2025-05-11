import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'buses_event.dart';
import 'buses_state.dart';

class BusesBloc extends Bloc<BusesEvent, BusesState> {
  BusesBloc() : super(BusesInicial()) {
    on<CargarBuses>(_onCargarBuses);
  }

  Future<void> _onCargarBuses(
      CargarBuses event, Emitter<BusesState> emit) async {
    emit(BusesCargando());

    try {
      // Simulación de carga
      await Future.delayed(Duration(seconds: 2));

      // Puedes reemplazar esto con una llamada real a una API o base de datos
      final List<Bus> buses = [];

      emit(BusesCargados(tipoBusqueda: event.tipoBusqueda, buses: buses));
    } catch (e) {
      emit(BusesError('Error al cargar los buses'));
    }
  }
}
