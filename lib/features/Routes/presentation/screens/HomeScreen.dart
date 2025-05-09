import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_type_request.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routelocations/route_locations_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/BusMenu.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/compact_search_box.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/search_panel.dart';
import 'package:georutasmovil/shared/utils/env.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LatLng cityCoordinates = const LatLng(12.728850, -86.124645);
  List<LatLng> _polylineCoordinates = [];
  bool _showSearchPanel = false;

  @override
  Widget build(BuildContext context) {
    // var _showCoordinates = false;

    return BlocBuilder<RouteLocationBloc, RouteLocationState>(
        builder: (contex, state) {
      Set<Marker> markers = {};

      if (state.originLat != null && state.originLng != null) {
        print("El origen fue: ${state.originLat!} + ${state.originLng!}");

        markers.add(
          Marker(
            markerId: MarkerId('origin'),
            position: LatLng(state.originLat!, state.originLng!),
            infoWindow: InfoWindow(title: 'Origen'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ),
        );
      }

      if (state.destinationLat != null && state.destinationLng != null) {
        markers.add(
          Marker(
            markerId: MarkerId('destination'),
            position: LatLng(state.destinationLat!, state.destinationLng!),
            infoWindow: InfoWindow(title: 'Destino'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        );
      }

      void miFuncion() {
        print("Hola, estoy ejecutando miFuncion!");
      }

      return SafeArea(
        child: BlocListener<RouteBloc, RouteState>(
          listener: (context, state) {
            if (state is GetCoordinateRouteByScheduleIdSuccess) {
              setState(() {
                _polylineCoordinates = state.response.map((toElement) {
                  return LatLng(toElement.Latitude, toElement.Longitude);
                }).toList();
              });
            }
          },
          child: Scaffold(
            appBar: AppBar(centerTitle: true, title: const Text("Ciudad")),
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: cityCoordinates, zoom: 16),
                  markers: markers,
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
                // if (_showSearchPanel) SearchPanel(),
                if (_showSearchPanel)
                  CompactSearchBox(
                      onMyLocationDestino: miFuncion,
                      onMyLocationOrigen: miFuncion),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                GetBusesByTypeRequest request =
                    new GetBusesByTypeRequest(BusTypeId: 1);

                context
                    .read<RouteBloc>()
                    .add(GetBusesByTypeEvent(request: request));

                if (index == 0) {
                  ShowBusMenu(context);
                } else if (index == 1) {
                  setState(() {
                    _showSearchPanel = !_showSearchPanel;
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
