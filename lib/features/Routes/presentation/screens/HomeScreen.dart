import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LatLng cityCoordinates = const LatLng(12.728850, -86.124645);

  void _showBusMenu(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    bool _showList = false;

    showGeneralDialog(
      context: context,
      barrierColor: Colors.transparent, // Quita el fondo negro transparente
      barrierDismissible: true, // Permite cerrar al tocar fuera
      barrierLabel: "Cerrar menú",
      pageBuilder: (context, anim1, anim2) {
        return BlocListener<RouteBloc, RouteState>(
          listener: (context, state) {
            if (state is GetBusTypesSuccess) {
              _showList = true;
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
                        const Text("Opciones",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        if (_showList)
                          BlocBuilder(builder: (context, state) {
                            if (state is GetBusTypesLoading) {
                              return Text("Loading");
                            } else if (state is GetBusTypesSuccess) {
                              return Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: 9,
                                  itemBuilder: (context, index) {
                                    return ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                          "Succes ${state.response[index].Name}"),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Text("Fali");
                            }
                          }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<RouteBloc, RouteState>(
        listener: (context, state) {
          if (state is GetBusesByTypeFailure) {
            //TODO
          }
        },
        child: Scaffold(
          appBar: AppBar(centerTitle: true, title: const Text("Ciudad")),
          body: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: cityCoordinates, zoom: 14),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
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
