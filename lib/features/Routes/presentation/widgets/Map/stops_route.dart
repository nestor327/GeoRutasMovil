import 'package:flutter/material.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StopsRoute extends StatefulWidget {
  const StopsRoute({super.key});

  @override
  State<StopsRoute> createState() => _StopsRouteState();
}

class _StopsRouteState extends State<StopsRoute> {
  List<Trip> viajes = [];
  List<Marker> marcadores = [];
  List<Polyline> routesPartials = [];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
