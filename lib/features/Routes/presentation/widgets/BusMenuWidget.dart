import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_event.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_state.dart';

class BusMenuWidget extends StatefulWidget {
  const BusMenuWidget({super.key});

  @override
  State<BusMenuWidget> createState() => _BusMenuWidgetState();
}

class _BusMenuWidgetState extends State<BusMenuWidget> {
  bool showComboBox = false;
  String? selectedTipo;

  final List<String> tipos = ['Tipo 1', 'Tipo 2', 'Tipo 3'];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Positioned(
      top: kToolbarHeight, // justo debajo de la barra de navegación
      left: 0,
      child: Container(
        width: screenSize.width * 0.25,
        height: screenSize.height * 0.5,
        color: Colors.grey[200],
        child: BlocBuilder<BusesBloc, BusesState>(
          builder: (context, state) {
            String? tipoBusqueda;
            List<Bus> buses = [];

            if (state is BusesLoaded) {
              tipoBusqueda = state.tipoBusqueda;
              buses = state.buses;
            }

            if (tipoBusqueda == null || tipoBusqueda.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() => showComboBox = !showComboBox);
                    },
                    child: const Text('Tipo'),
                  ),
                  TextButton(
                    onPressed: () {}, // Aquí puedes emitir eventos si deseas
                    child: const Text('Nombre'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Ubicación'),
                  ),
                  if (showComboBox)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropdownButton<String>(
                        hint: const Text('Selecciona un tipo'),
                        value: selectedTipo,
                        items: tipos.map((tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(tipo),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => selectedTipo = value);
                          if (value != null) {
                            context.read<BusesBloc>().add(CargarBuses(value));
                          }
                        },
                      ),
                    ),
                ],
              );
            } else {
              return Container(
                color: Colors.lightBlue[50],
                child: ListView(
                  children: buses
                      .map((bus) => Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(8),
                            color: Colors.blue[100],
                            child: Text(bus.Name),
                          ))
                      .toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
