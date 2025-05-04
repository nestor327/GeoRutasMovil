import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_coordinate_routes_by_schedule_id_request.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_schedule_by_bus_id_week_day_and_hour_request.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';

void ShowRoutesMenu(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  bool _showList = false;
  late List<Bus> buses;

  showGeneralDialog(
    context: context,
    barrierColor: Colors.transparent,
    barrierDismissible: true,
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
                    width: screenWidth / 3,
                    height: screenHeight * 0.35,
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
