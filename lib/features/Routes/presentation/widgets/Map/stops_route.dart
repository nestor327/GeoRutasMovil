import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip_paginated.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';
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
  TripPaginated tripPaginated = new TripPaginated(
      PagingInfo: PagingInf(PerPage: 0, CurrentPage: 0, TotalRecords: 0),
      Records: List.empty());

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: [
      BlocListener<RouteBloc, RouteState>(listener: (context, state) {
        if (state is GetTripsByLocationSuccess) {
          //Obtener la lista de viajes
          tripPaginated = state.response;
          viajes = tripPaginated.Records;
        }
      })
    ], child: const Placeholder());
  }
}
