import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/coordinate_detail.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_type_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_stop_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/stop.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_state.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routelocations/route_locations_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/BusMenuWidget.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/Map/toggling_stop_buttons.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/RouteMenuWidget.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/autocomplete_search_bus.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/autocomplete_search_bus_by_location.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/compact_search_box.dart';
import 'package:georutasmovil/shared/utils/env.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final LatLng cityCoordinates = const LatLng(12.134397, -86.235405);
  List<LatLng> _polylineCoordinates = [];
  Set<Marker> stops = {};
  List<Stop> nativeStops = [];
  late BitmapDescriptor busIconRight;
  late BitmapDescriptor busIconLeft;
  bool _showSearchPanel = false;
  bool _showMenuList = false;
  bool _showMenuListWithBuses = false;
  bool _showAutoCompleteBusName = false;
  int _selectedNavegationIndex = 0;
  bool _showAutoCompleteBusLocation = false;
  CoordinateDetails coordinateDetails = new CoordinateDetails(
      ScheduleId: 0,
      IdCoordinateNorthSouthInitial: 0,
      IdCoordinateSouthNorthEnd: 0,
      IdStopNorthSouthInitial: 0,
      IdStopSouthNorthEnd: 0,
      coordinates: []);

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadBusIcon();
  }

  Future<void> _loadBusIcon() async {
    busIconLeft = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/leftStop.png',
    );
    busIconRight = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/rightStop.png',
    );
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _keyboardVisible) {
      setState(() {
        _keyboardVisible = newValue;
      });

      if (_keyboardVisible) {
        setState(() {
          _showMenuList = false;
          _showMenuListWithBuses = false;
        });
        print("Teclado abierto");
      } else {
        print("Teclado cerrado");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteLocationBloc, RouteLogState>(
        builder: (contex, state) {
      Set<Marker> markers = {};

      if (state is RouteLocationState) {
        if (state.originLat != null && state.originLng != null) {
          print("El origen fue: ${state.originLat!} + ${state.originLng!}");

          markers.add(
            Marker(
              markerId: const MarkerId('origin'),
              position: LatLng(state.originLat!, state.originLng!),
              infoWindow: const InfoWindow(title: 'Origen'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
            ),
          );
        }

        if (state.destinationLat != null && state.destinationLng != null) {
          markers.add(
            Marker(
              markerId: const MarkerId('destination'),
              position: LatLng(state.destinationLat!, state.destinationLng!),
              infoWindow: const InfoWindow(title: 'Destino'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
            ),
          );
        }
      }

      void miFuncion() {
        print("Hola, estoy ejecutando miFuncion!");
      }

      return SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<RouteBloc, RouteState>(
              listener: (context, state) {
                if (state is GetCoordinateRouteByScheduleIdSuccess) {
                  setState(() {
                    _polylineCoordinates = state.response.map((toElement) {
                      return LatLng(toElement.Latitude, toElement.Longitude);
                    }).toList();
                  });
                }
                if (state is GetBusesByLocationLoading) {
                  setState(() {
                    _showMenuListWithBuses = true;
                  });
                }
                if (state is GetBusesByLocationSuccess) {
                  print(
                      "La mierda de buses por ubicacion se completo con exito");
                  setState(() {
                    _showMenuListWithBuses = true;
                  });
                }
                if (state is GetStopsByScheduleIdSuccess) {
                  print(
                      "SE ENCONTRARON VARIAS PARADAS ${state.response.length}");
                  setState(() {
                    nativeStops = state.response;
                    stops = state.response.map((el) {
                      return Marker(
                        markerId: MarkerId(el.Id.toString()),
                        position: LatLng(el.Latitude, el.Longitude),
                        infoWindow:
                            InfoWindow(title: 'Stop ' + el.Id.toString()),
                        icon: el.Id > coordinateDetails.IdStopSouthNorthEnd
                            ? busIconRight
                            : busIconLeft,
                      );
                    }).toSet();
                  });
                }
              },
            ),
            BlocListener<RouteLocationBloc, RouteLogState>(
                listener: (contex, state) {
              if (state is GetCoordinateRouteByBusIdLoaded) {
                context.read<RouteBloc>().add(GetStopsByScheduleIdEvent(
                    request: GetStopByScheduleIdRequest(
                        ScheduleId: state.coordinates!.ScheduleId)));

                setState(() {
                  coordinateDetails = state.coordinates!;
                });
                print(
                    "Se actualizo la meirda de las coordenadas ${state.coordinates?.coordinates.length}");
                setState(() {
                  _polylineCoordinates =
                      state.coordinates!.coordinates.map((toElement) {
                    return LatLng(toElement.Latitude, toElement.Longitude);
                  }).toList();

                  if (_polylineCoordinates.length == 0) {
                    stops = {};
                  }
                });
              }
            }),
            BlocListener<BusesBloc, BusesState>(
              listener: (context, state) {
                if (state is ShowSearchBusFieldLoaded) {
                  print(
                      "Se esta intentando actualizar la mierda ${state.showAutoCompleteBusName}");

                  setState(() {
                    _showAutoCompleteBusName = state.showAutoCompleteBusName!;
                  });
                }
                if (state is ShowSearchLocationBusFieldLoaded) {
                  setState(() {
                    _showAutoCompleteBusLocation =
                        state.showAutoCompleteBusLocation!;
                  });
                }

                if (state is SetShowSearchBusStopLocationFieldLoaded) {
                  print(
                      "Se esta actualizando la mierda ${state.SetShowSearchBusLocationFieldLeft}+ ${state.SetShowSearchBusLocationFieldRight}");

                  if (state.SetShowSearchBusLocationFieldLeft == true &&
                      state.SetShowSearchBusLocationFieldRight == false) {
                    print("Entro al 1");
                    setState(() {
                      _polylineCoordinates = coordinateDetails.coordinates
                          .where((el) =>
                              el.Id <=
                              coordinateDetails.IdCoordinateSouthNorthEnd)
                          .map((toElement) {
                        return LatLng(toElement.Latitude, toElement.Longitude);
                      }).toList();

                      stops = nativeStops
                          .where((stop) =>
                              stop.Id <= coordinateDetails.IdStopSouthNorthEnd)
                          .map((el) {
                        return Marker(
                          markerId: MarkerId(el.Id.toString()),
                          position: LatLng(el.Latitude, el.Longitude),
                          infoWindow:
                              InfoWindow(title: 'Stop ' + el.Id.toString()),
                          icon: el.Id > coordinateDetails.IdStopSouthNorthEnd
                              ? busIconRight
                              : busIconLeft,
                        );
                      }).toSet();
                    });
                  } else if (state.SetShowSearchBusLocationFieldLeft == false &&
                      state.SetShowSearchBusLocationFieldRight == true) {
                    print("Entro al 2");
                    setState(() {
                      _polylineCoordinates = coordinateDetails.coordinates
                          .where((el) =>
                              el.Id >=
                                  coordinateDetails
                                      .IdCoordinateNorthSouthInitial &&
                              coordinateDetails.IdCoordinateNorthSouthInitial >
                                  0)
                          .map((toElement) {
                        return LatLng(toElement.Latitude, toElement.Longitude);
                      }).toList();

                      stops = nativeStops
                          .where((stop) =>
                              stop.Id >=
                                  coordinateDetails.IdStopNorthSouthInitial &&
                              coordinateDetails.IdStopNorthSouthInitial > 0)
                          .map((el) {
                        return Marker(
                          markerId: MarkerId(el.Id.toString()),
                          position: LatLng(el.Latitude, el.Longitude),
                          infoWindow:
                              InfoWindow(title: 'Stop ' + el.Id.toString()),
                          icon: el.Id > coordinateDetails.IdStopSouthNorthEnd
                              ? busIconRight
                              : busIconLeft,
                        );
                      }).toSet();
                    });
                  } else if (state.SetShowSearchBusLocationFieldLeft == true &&
                      state.SetShowSearchBusLocationFieldRight == true) {
                    print("Entro al 3");
                    setState(() {
                      _polylineCoordinates =
                          coordinateDetails.coordinates.map((toElement) {
                        return LatLng(toElement.Latitude, toElement.Longitude);
                      }).toList();
                      stops = nativeStops.map((el) {
                        return Marker(
                          markerId: MarkerId(el.Id.toString()),
                          position: LatLng(el.Latitude, el.Longitude),
                          infoWindow:
                              InfoWindow(title: 'Stop ' + el.Id.toString()),
                          icon: el.Id > coordinateDetails.IdStopSouthNorthEnd
                              ? busIconRight
                              : busIconLeft,
                        );
                      }).toSet();
                    });
                  } else {
                    print("Entro al 4");
                    setState(() {
                      _polylineCoordinates = [];
                      stops = {};
                    });
                  }
                }
              },
            )
          ],
          child: Scaffold(
            body: Stack(
              children: [
                GoogleMap(
                  zoomControlsEnabled: false,
                  onTap: (argument) => {
                    setState(() {
                      _showSearchPanel = false;
                      _showMenuList = false;
                      _showAutoCompleteBusName = false;
                      _showAutoCompleteBusLocation = false;
                    })
                  },
                  initialCameraPosition:
                      CameraPosition(target: cityCoordinates, zoom: 12),
                  markers: (stops.length > 0) ? stops : markers,
                  polylines: {
                    if (_polylineCoordinates.length > 0)
                      Polyline(
                          polylineId: const PolylineId("Poly1"),
                          color: Colors.blue,
                          points: _polylineCoordinates,
                          width: 4)
                  },
                  key: Key(EnvConfig.mapApyKey),
                ),
                if (_showSearchPanel)
                  CompactSearchBox(
                      onMyLocationDestino: miFuncion,
                      onMyLocationOrigen: miFuncion),
                if ((_showMenuList &&
                        !_showAutoCompleteBusName &&
                        !_showAutoCompleteBusLocation) ||
                    (_showMenuListWithBuses && _showAutoCompleteBusLocation))
                  const BusMenuWidget(),
                if (_showAutoCompleteBusName)
                  AutocompleteSearchBus(
                    onBusName: miFuncion,
                  ),
                if (_showAutoCompleteBusLocation)
                  AutocompleteSearchBusByLocation(onBusLocation: miFuncion),
                if ((_polylineCoordinates.length > 0 ||
                        coordinateDetails.coordinates.isNotEmpty) &&
                    coordinateDetails.IdCoordinateNorthSouthInitial > 0 &&
                    coordinateDetails.IdCoordinateSouthNorthEnd > 0 &&
                    coordinateDetails.IdStopNorthSouthInitial > 0 &&
                    coordinateDetails.IdStopSouthNorthEnd > 0)
                  const TogglingStopButtons(),
                Routemenuwidget()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedNavegationIndex,
              onTap: (index) {
                GetBusesByTypeRequest request =
                    new GetBusesByTypeRequest(BusTypeId: 1);

                context
                    .read<RouteBloc>()
                    .add(GetBusesByTypeEvent(request: request));

                if (index == 0) {
                  setState(() {
                    _showMenuList = (_showAutoCompleteBusName ||
                            _showAutoCompleteBusLocation)
                        ? true
                        : !_showMenuList;
                    _showSearchPanel = false;
                    _showAutoCompleteBusName = false;
                    _selectedNavegationIndex = 0;
                    _showAutoCompleteBusLocation = false;
                    _showMenuListWithBuses = false;
                  });
                } else if (index == 1) {
                  setState(() {
                    _showSearchPanel = !_showSearchPanel;
                    _showMenuList = false;
                    _showAutoCompleteBusName = false;
                    _selectedNavegationIndex = 1;
                    _showAutoCompleteBusLocation = false;
                    _showMenuListWithBuses = false;
                    coordinateDetails.coordinates = [];
                    _polylineCoordinates = [];
                    stops = {};
                  });
                } else {
                  setState(() {
                    _showSearchPanel = false;
                    _showMenuList = false;
                    _showAutoCompleteBusName = false;
                    _selectedNavegationIndex = index;
                    _showAutoCompleteBusLocation = false;
                    _showMenuListWithBuses = false;
                    coordinateDetails.coordinates = [];
                    _polylineCoordinates = [];
                    stops = {};
                  });
                }
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
    });
  }
}
