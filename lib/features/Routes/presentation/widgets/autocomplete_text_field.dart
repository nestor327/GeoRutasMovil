import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routelocations/route_locations_bloc.dart';
import 'package:georutasmovil/shared/utils/env.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class AutocompleteTextField extends StatefulWidget {
  final String titulo;
  final VoidCallback onTap;

  AutocompleteTextField({super.key, required this.titulo, required this.onTap});
  // const AutocompleteTextField({
  //   Key? key,
  //   required String titulo,
  //   required VoidCallback onTap,
  //   required this.titulo,
  // }) : super(key: key);

  @override
  State<AutocompleteTextField> createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  List<dynamic> listOfLocation = [];
  final searchController = TextEditingController();
  final String token = '1234567890';
  var uuid = const Uuid();
  final FocusNode _focusNode = FocusNode();
  bool focusActivo = false;

  void placeSuggestion(String input) async {
    String apiKey = EnvConfig.mapApyKey;

    print("Intentando obtener lugares");
    try {
      print("El focus activo es: ${focusActivo}");
      if (input.isEmpty || input.length <= 3 || !focusActivo) {
        return;
      }
      String bassedUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json";

      String request =
          '$bassedUrl?input=$input&key=$apiKey&sessiontoken=$token';

      var response = await http.get(Uri.parse(request));

      // var data = json.decode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          listOfLocation = json.decode(response.body)['predictions'];
          print(listOfLocation[0]);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _onChange() {
    placeSuggestion(searchController.text);
  }

  @override
  void initState() {
    searchController.addListener(() {
      _onChange();
    });
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print('TextField recibió el foco');
        setState(() {
          focusActivo = true;
        });
      } else {
        print('TextField perdió el foco');
        setState(() {
          focusActivo = false;
        });
      }
    });
  }

  Future<void> getCoordinatesFromPlaceId(
      String placeId, String description) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${EnvConfig.mapApyKey}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        final location = data['result']['geometry']['location'];
        final lat = location['lat'];
        final lng = location['lng'];

        if (widget.titulo == "Busca un origen") {
          print("SE GUARDO EL ORIGIN");
          context
              .read<RouteLocationBloc>()
              .add(SetOriginCoordinates(lat: lat, lng: lng));

          setState(() {
            listOfLocation = [];
            searchController.text = description.length <= 26
                ? description
                : description.substring(0, 25);
          });
        } else {
          print("SE GUARDO EL DESTINO");
          context
              .read<RouteLocationBloc>()
              .add(SetDestinationCoordinates(lat: lat, lng: lng));

          setState(() {
            listOfLocation = [];
            searchController.text = description.length <= 26
                ? description
                : description.substring(0, 25);
          });
        }
        _focusNode.unfocus();
        // setState(() {
        //   focusActivo = false;
        // });

        print('Latitude: $lat, Longitude: $lng');
      } else {
        print('API error: ${data['status']} - ${data['error_message']}');
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Muy importante limpiar el FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(hintText: widget.titulo),
                onChanged: (value) {},
                focusNode: _focusNode,
              ),
              Visibility(
                  visible: searchController.text.isEmpty || !focusActivo
                      ? false
                      : true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: listOfLocation.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("Se le dio clcik a la opcion");
                            getCoordinatesFromPlaceId(
                                listOfLocation[index]["place_id"],
                                listOfLocation[index]["description"]);
                          },
                          child: ListTile(
                            title: Text(listOfLocation[index]["description"]
                                        .toString()
                                        .length <
                                    26
                                ? listOfLocation[index]["description"]
                                : listOfLocation[index]["description"]
                                    .toString()
                                    .substring(0, 25)),
                          ),
                        );
                      }))
            ],
          ),
        ),
        Visibility(
          visible: searchController.text.isEmpty ? true : false,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: widget.onTap,
            icon: const Icon(Icons.my_location, size: 16),
            label: Text("${focusActivo ? "" : "Mi ubicación"}",
                style: TextStyle(fontSize: 12)),
          ),
        )
      ],
    );
  }
}
