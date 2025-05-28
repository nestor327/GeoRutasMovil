import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip.dart';
import 'package:georutasmovil/features/Routes/domain/entities/trip_paginated.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';

class Routemenuwidget extends StatefulWidget {
  const Routemenuwidget({super.key});

  @override
  State<Routemenuwidget> createState() => _RoutemenuwidgetState();
}

class _RoutemenuwidgetState extends State<Routemenuwidget> {
  List<Bus> routes = [];
  List<Trip> routesFilter = [];
  TripPaginated tripPaginated = new TripPaginated(
      PagingInfo: PagingInf(PerPage: 0, CurrentPage: 0, TotalRecords: 0),
      Records: List.empty());
  bool showAcitivityIndicator = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Positioned(
        left: screenSize.width * 0.33,
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: const Radius.circular(12))),
          child: BlocBuilder<RouteBloc, RouteState>(builder: (context, state) {
            if (state is GetTripsByLocationSuccess) {
              // Cargar a las rutas
              setState(() {
                tripPaginated = state.response;
                routesFilter = state.response.Records;
              });
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Rutas",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                if (routes.isEmpty)
                  SizedBox(
                    height: screenSize.height * 0.25,
                  ),
                if (showAcitivityIndicator)
                  const Center(child: CircularProgressIndicator()),
                if (routes.isNotEmpty)
                  SizedBox(
                    height: screenSize.height * 0.25,
                    child: ListView.builder(
                      itemCount: routes.length,
                      itemBuilder: (context, index) {
                        final bus = routes[index];
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              print("Se mando a llamar la mierda del bloc");
                              // context.read<RouteLocationBloc>().add(
                              //     GetCoodintateRouteByBusIdEvent(
                              //         request:
                              //             new GetCoordinateByBusIdRequest(
                              //                 busId: bus.Id,
                              //                 weekDayId:
                              //                     DateTime.now().weekday,
                              //                 time: TimeOfDay.now())));
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
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
              ],
            );
          }),
        )));
  }
}
