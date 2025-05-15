import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_event.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_state.dart';

// class BusMenuWidget extends StatefulWidget {
//   const BusMenuWidget({super.key});

//   @override
//   State<BusMenuWidget> createState() => _BusMenuWidgetState();
// }

// class _BusMenuWidgetState extends State<BusMenuWidget> {
//   bool showComboBox = false;
//   String? selectedTipo;

//   final List<String> tipos = ['Tipo 1', 'Tipo 2', 'Tipo 3'];

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Positioned(
//       left: 0,
//       bottom: 0,
//       child: SafeArea(
//         child: Container(
//           width: screenSize.width * 0.25,
//           constraints: BoxConstraints(
//             maxHeight: screenSize.height * 0.4,
//           ),
//           color: Colors.white,
//           child: BlocBuilder<BusesBloc, BusesState>(
//             builder: (context, state) {
//               String? tipoBusqueda;
//               List<Bus> buses = [];

//               if (state is BusesLoaded) {
//                 tipoBusqueda = state.tipoBusqueda;
//                 buses = state.buses;
//               }

//               if (tipoBusqueda == null || tipoBusqueda.isEmpty || true) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Buses",
//                       textAlign: TextAlign.center
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         setState(() => showComboBox = !showComboBox);
//                       },
//                       child: const Text('Tipo'),
//                     ),
//                     TextButton(
//                       onPressed: () {}, // Aquí puedes emitir eventos si deseas
//                       child: const Text('Nombre'),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text('Ubicación'),
//                     ),
//                     if (showComboBox)
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: DropdownButton<String>(
//                           hint: const Text('Selecciona un tipo'),
//                           value: selectedTipo,
//                           items: tipos.map((tipo) {
//                             return DropdownMenuItem(
//                               value: tipo,
//                               child: Text(tipo),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() => selectedTipo = value);
//                             if (value != null) {
//                               context.read<BusesBloc>().add(CargarBuses(value));
//                             }
//                           },
//                         ),
//                       ),
//                   ],
//                 );
//               } else {
//                 return Container(
//                   color: Colors.lightBlue[50],
//                   child: ListView(
//                     children: buses
//                         .map((bus) => Container(
//                               margin: const EdgeInsets.all(4),
//                               padding: const EdgeInsets.all(8),
//                               color: Colors.blue[100],
//                               child: Text(bus.Name),
//                             ))
//                         .toList(),
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class BusMenuWidget extends StatefulWidget {
  const BusMenuWidget({super.key});

  @override
  State<BusMenuWidget> createState() => _BusMenuWidgetState();
}

class _BusMenuWidgetState extends State<BusMenuWidget> {
  bool showTipoSelector = false;
  String? selectedTipo;

  final List<String> tipos = ['Cooperativas', 'Ruteados', 'Independientes'];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Positioned(
      left: 0,
      bottom: 0,
      child: SafeArea(
        child: Container(
          width: screenSize.width * 0.33,
          constraints: BoxConstraints(
            maxHeight: screenSize.height * 0.4,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
            borderRadius: BorderRadius.only(topRight: Radius.circular(12)),
          ),
          child: BlocBuilder<BusesBloc, BusesState>(
            builder: (context, state) {
              String? tipoBusqueda;
              List<Bus> buses = [];

              if (state is BusesLoaded) {
                tipoBusqueda = state.tipoBusqueda;
                buses = state.buses;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Buses',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (buses.isEmpty)
                    Text(
                      showTipoSelector ? 'Tipo →' : 'Buscar por',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  const SizedBox(height: 8),

                  // Si hay buses, mostramos la lista
                  if (buses.isNotEmpty)
                    SizedBox(
                      height: screenSize.height * 0.25,
                      child: ListView.builder(
                        itemCount: buses.length,
                        itemBuilder: (context, index) {
                          final bus = buses[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              bus.Name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ),
                    )

                  // Si está activo el selector de tipo
                  else if (showTipoSelector)
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DropdownButton<String>(
                            isExpanded: true,
                            hint: const Text('Selecciona un tipo'),
                            value: selectedTipo,
                            items: tipos.map((tipo) {
                              return DropdownMenuItem(
                                value: tipo,
                                child: Text(tipo),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedTipo = value;
                                showTipoSelector = false;
                              });
                              if (value != null) {
                                context
                                    .read<BusesBloc>()
                                    .add(CargarBuses(value));
                              }
                            },
                          )
                        ])
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 4),
                  //   child: DropdownButton<String>(
                  //     isExpanded: true,
                  //     hint: const Text('Selecciona un tipo'),
                  //     value: selectedTipo,
                  //     items: tipos.map((tipo) {
                  //       return DropdownMenuItem(
                  //         value: tipo,
                  //         child: Text(tipo),
                  //       );
                  //     }).toList(),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         selectedTipo = value;
                  //         showTipoSelector = false;
                  //       });
                  //       if (value != null) {
                  //         context.read<BusesBloc>().add(CargarBuses(value));
                  //       }
                  //     },
                  //   ),
                  // )

                  // Si no hay búsqueda ni buses
                  else
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() => showTipoSelector = true);
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                isExpanded: true,
                                dropdownColor: Colors.white,
                                alignment: Alignment.center,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.white),
                                hint: const Text(
                                  'Tipo',
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: selectedTipo,
                                items: tipos.map((tipo) {
                                  return DropdownMenuItem(
                                    value: tipo,
                                    alignment: Alignment.center,
                                    child: Text(
                                      tipo,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedTipo = value;
                                    showTipoSelector = false;
                                  });
                                  if (value != null) {
                                    context
                                        .read<BusesBloc>()
                                        .add(CargarBuses(value));
                                  }
                                },
                              )),
                            )),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              // Acción futura
                            },
                            child: const Text('Nombre'),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              // Acción futura
                            },
                            child: const Text('Ubicación'),
                          ),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
