import 'package:flutter/material.dart';
import 'package:georutasmovil/features/Auth/presentation/widgets/CustomScaffold.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ciudad"),
      ),
      body: const GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(12.728850, -86.124645))),
      backgroundColor: Colors.amber,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus_rounded), label: "Buses"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded),
              label: "Settings")
        ],
      ),
    ));
  }
}
