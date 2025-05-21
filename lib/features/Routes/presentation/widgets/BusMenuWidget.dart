import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_by_bus_id_request.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_event.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_state.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routelocations/route_locations_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';

class BusMenuWidget extends StatefulWidget {
  const BusMenuWidget({super.key});

  @override
  State<BusMenuWidget> createState() => _BusMenuWidgetState();
}

class _BusMenuWidgetState extends State<BusMenuWidget> {
  bool showTipoSelector = false;
  bool showAcitivityIndicator = false;
  String? selectedTipo;
  List<Bus> buses = [];

  final List<String> tipos = ['Cooperativas', 'Ruteados', 'Independientes'];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MultiBlocListener(
      listeners: [
        BlocListener<RouteBloc, RouteState>(
          listener: (context, state) {
            if (state is GetBusesByLocationSuccess) {
              print(
                  "La mierda de buses por ubicacion se completo con exito ${state.buses.length}");

              buses = state.buses;
            }
          },
        ),
      ],
      child: Positioned(
        left: 0,
        bottom: 0,
        child: SafeArea(
          child: Container(
            width: screenSize.width * 0.33,
            constraints: BoxConstraints(
              maxHeight: screenSize.height * 0.4,
            ),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              borderRadius: BorderRadius.only(topRight: Radius.circular(12)),
            ),
            child: BlocBuilder<BusesBloc, BusesState>(
              builder: (context, state) {
                String? tipoBusqueda;

                if (state is BusesLoaded) {
                  tipoBusqueda = state.tipoBusqueda;
                  if (tipoBusqueda.isEmpty) {
                    showAcitivityIndicator = false;
                    selectedTipo = null;
                  }
                  buses = state.buses;
                  print("Aqui se actyalizo la mierda ${buses.length}");
                }
                if (state is BusesLoading) {
                  showAcitivityIndicator = true;
                } else {
                  showAcitivityIndicator = false;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment:
                          (buses.isEmpty && !showAcitivityIndicator)
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                      children: [
                        if (buses.isNotEmpty || showAcitivityIndicator)
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<BusesBloc>()
                                  .add(const CargarBuses(""));
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.arrow_back,
                                size: 22,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        const Text(
                          'Buses',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    if (buses.isEmpty && !showAcitivityIndicator)
                      Text(
                        showTipoSelector ? 'Tipo →' : 'Buscar por',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    if (buses.isEmpty) const SizedBox(height: 8),
                    if (showAcitivityIndicator)
                      const Center(child: CircularProgressIndicator()),
                    if (buses.isNotEmpty)
                      SizedBox(
                        height: screenSize.height * 0.25,
                        child: ListView.builder(
                          itemCount: buses.length,
                          itemBuilder: (context, index) {
                            final bus = buses[index];
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  print("Se mando a llamar la mierda del bloc");
                                  context.read<RouteLocationBloc>().add(
                                      GetCoodintateRouteByBusIdEvent(
                                          request:
                                              new GetCoordinateByBusIdRequest(
                                                  busId: bus.Id,
                                                  weekDayId:
                                                      DateTime.now().weekday,
                                                  time: TimeOfDay.now())));
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  padding: const EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    bus.Name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    else if (!showAcitivityIndicator)
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
                                        style: const TextStyle(
                                            color: Colors.black),
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
                                print(
                                    "Se esta intentando actualizar la mierda");

                                context
                                    .read<BusesBloc>()
                                    .add(SetShowSearchBusField(true));
                              },
                              child: const Text('Nombre'),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<BusesBloc>().add(
                                    SetShowSearchBusLocationFieldEvent(true));
                              },
                              child: const Text('Ubicación'),
                            ),
                          ),
                        ],
                      )
                    else
                      const SizedBox(height: 165)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
