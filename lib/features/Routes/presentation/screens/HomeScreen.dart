import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_type_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_routes_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_schedule_by_bus_id_week_day_and_hour_request.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';
import 'package:georutasmovil/shared/utils/env.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LatLng cityCoordinates = const LatLng(12.728850, -86.124645);
  List<LatLng> _polylineCoordinates = [
    // LatLng(37.42796133580664, -122.085749655962),
    // LatLng(37.42866133580664, -122.088749655962),
    // LatLng(37.42936133580664, -122.089749655962),
  ];

  void _showBusMenu(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    bool _showList = false;
    late List<Bus> buses;

    showGeneralDialog(
      context: context,
      barrierColor: Colors.transparent, // Quita el fondo negro transparente
      barrierDismissible: true, // Permite cerrar al tocar fuera
      barrierLabel: "Cerrar menú",
      pageBuilder: (context, anim1, anim2) {
        return StatefulBuilder(builder: (context, setState) {
          return BlocListener<RouteBloc, RouteState>(
            listener: (context, state) {
              if (state is GetBusesByTypeSuccess) {
                print("Se realizo la asignacion");
                setState(() {
                  buses = state.response;
                });

                print("Se realizo la asignacion ${buses.length}");
                setState(() {
                  _showList = true;
                });
              } else if (_showList) {
                print("Entro aqui por alguna razon ${state.toString()}");
              }

              if (state is GetScheduleByBusIdAndWeekDayAndTimeSuccess) {
                print("Intentando realizar el llamado a las coordenadas");

                GetCoordinateRoutesByScheduleIdRequest request =
                    GetCoordinateRoutesByScheduleIdRequest(
                        ScheduleId: state.response.Id);

                context
                    .read<RouteBloc>()
                    .add(GetCoordinateRouteByScheduleIdEvent(request: request));
              }

              if (state is GetCoordinateRouteByScheduleIdSuccess) {
                Navigator.of(context).pop();
              }
            },
            child: Stack(
              children: [
                Positioned(
                  bottom: 60, // Justo encima de la barra de navegación
                  child: Material(
                    color: Colors.white,
                    elevation: 5,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Container(
                      width: screenWidth / 3, // Ancho del modal
                      height: screenHeight * 0.35, // Altura ajustable
                      padding: const EdgeInsets.only(
                          bottom: 0, left: 10, right: 10, top: 0),
                      child: Column(
                        children: [
                          const Text("Buses",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          if (!_showList) Text("Ocurrio una falla"),
                          if (_showList)
                            BlocBuilder<RouteBloc, RouteState>(
                                builder: (context, state) {
                              return Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: buses.length,
                                  itemBuilder: (context, index) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        int weekDay = DateTime.now().weekday;
                                        print(
                                            "El dia encontrado fue :${weekDay}");
                                        print(
                                            "La fecha fue :${TimeOfDay.now().format(context)}");
                                        print(
                                            "La fecha fue :${DateTime.now().timeZoneOffset.toString()}");
                                        print(
                                            "El id del bus fue :${buses[index].Id}");

                                        GetScheduleByBusIdWeekDayAndHourRequest
                                            request =
                                            GetScheduleByBusIdWeekDayAndHourRequest(
                                                BusId: buses[index].Id,
                                                Time: TimeOfDay.now(),
                                                WeekDayId: weekDay);

                                        context.read<RouteBloc>().add(
                                            GetScheduleByBusIdAndWeekDayAndTimeEvent(
                                                request: request));
                                      },
                                      child: Text(buses[index].Name),
                                    );
                                  },
                                ),
                              );
                            }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // var _showCoordinates = false;

    return SafeArea(
      child: BlocListener<RouteBloc, RouteState>(
        listener: (context, state) {
          if (state is GetCoordinateRouteByScheduleIdSuccess) {
            setState(() {
              _polylineCoordinates = state.response.map((toElement) {
                return LatLng(toElement.Latitude, toElement.Longitude);
              }).toList();

              // _polylineCoordinates = [
              //   LatLng(37.42796133580664, -122.085749655962),
              //   LatLng(37.42866133580664, -122.088749655962),
              //   LatLng(37.42936133580664, -122.089749655962),
              // ];
            });
            print(
                "Se asigno los valores de la polyline ${_polylineCoordinates.length}");
            // setState(() {
            //   _showCoordinates = true;
            // });
          }
        },
        child: Scaffold(
          appBar: AppBar(centerTitle: true, title: const Text("Ciudad")),
          body: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: cityCoordinates, zoom: 16),
            polylines: {
              if (_polylineCoordinates.length > 0)
                Polyline(
                    polylineId: PolylineId("Poly1"),
                    color: Colors.blue,
                    points: _polylineCoordinates,
                    width: 4),
              if (_polylineCoordinates.length == 0)
                const Polyline(
                    polylineId: PolylineId("Poly2"),
                    color: Colors.blue,
                    points: [
                      LatLng(12.742475, -86.121136),
                      LatLng(12.729415, -86.126544)
                    ],
                    width: 4)
            },
            key: Key(EnvConfig.mapApyKey),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              GetBusesByTypeRequest request =
                  new GetBusesByTypeRequest(BusTypeId: 1);

              context
                  .read<RouteBloc>()
                  .add(GetBusesByTypeEvent(request: request));

              if (index == 0) _showBusMenu(context);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.directions_bus_rounded), label: "Buses"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle_rounded),
                  label: "Settings"),
            ],
          ),
        ),
      ),
    );
  }
}
