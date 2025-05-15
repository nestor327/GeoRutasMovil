import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/shared/utils/env.dart';
import 'buses_event.dart';
import 'buses_state.dart';

class BusesBloc extends Bloc<BusesEvent, BusesState> {
  BusesBloc() : super(BusesInicial()) {
    on<CargarBuses>(_onCargarBuses);
  }

  Future<void> _onCargarBuses(
      CargarBuses event, Emitter<BusesState> emit) async {
    emit(BusesLoading());

    try {
      // Simulación de carga
      await Future.delayed(Duration(seconds: 2));
      final Dio dio = Dio();

      // Puedes reemplazar esto con una llamada real a una API o base de datos

      if (event.tipoBusqueda.isEmpty) {
        print("No hay ni mierda que validar");
      } else {
        if (event.tipoBusqueda == "Cooperativas") {
          final resp = await dio.get(
            'http://192.168.1.14:5005/v1/bus/buses-by-bustype?busTypeId=${1}',
            options: Options(
              headers: {
                'accept': 'text/plain',
                'X-Language': 'es',
                'Content-Type': 'application/json',
                'X-Api-Key': EnvConfig.geoRutasApyKey
              },
            ),
          );

          print("El resp code fue: ${resp.statusCode}");
          if (resp.statusCode == 200) {
            final List<Bus> busTypeModels = Bus.parseEntidades(resp.data);

            emit(BusesLoaded(
                tipoBusqueda: event.tipoBusqueda, buses: busTypeModels));
          }
        }

        print("El tipo de busqueda fue ${event.tipoBusqueda}");
      }

      final List<Bus> buses = [];

      emit(BusesLoaded(tipoBusqueda: event.tipoBusqueda, buses: buses));
    } catch (e) {
      emit(BusesError('Error al cargar los buses'));
    }
  }
}
