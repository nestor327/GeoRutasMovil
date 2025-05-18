import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:georutasmovil/features/Routes/domain/entities/bus.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../../../../shared/utils/env.dart';

class AutocompleteSearchBus extends StatefulWidget {
  final VoidCallback onBusName;

  const AutocompleteSearchBus({super.key, required this.onBusName});

  @override
  State<AutocompleteSearchBus> createState() => _AutocompleteSearchBusState();
}

class _AutocompleteSearchBusState extends State<AutocompleteSearchBus> {
  List<Bus> listOfLocation = [];
  final searchController = TextEditingController();
  final String token = '1234567890';
  var uuid = const Uuid();
  final FocusNode _focusNode = FocusNode();
  bool focusActivo = false;

  void placeSuggestion(String input) async {
    final Dio dio = Dio();

    print("Intentando obtener lugares");
    try {
      print("El focus activo es: ${focusActivo}");
      if (input.isEmpty || input.length <= 1 || !focusActivo) {
        setState(() {
          listOfLocation = [];
        });
        return;
      }

      final resp = await dio.get(
        'http://192.168.1.14:5005/v1/bus/buses-by-busname?busName=${input}',
        options: Options(
          headers: {
            'accept': 'text/plain',
            'X-Language': 'es',
            'Content-Type': 'application/json',
            'X-Api-Key': EnvConfig.geoRutasApyKey
          },
        ),
      );

      if (resp.statusCode == 200) {
        print("La mierda encontrada fue: ");

        final List<Bus> busTypeModels = Bus.parseEntidades(resp.data);
        print(busTypeModels.length);
        setState(() {
          if (busTypeModels.length >= 7) {
            listOfLocation = busTypeModels.sublist(0, 5);
          } else {
            listOfLocation = busTypeModels;
          }
        });
      } else {
        print(resp.statusCode);
        setState(() {
          listOfLocation = [];
        });
      }
    } catch (e) {
      print("ERROR: ${e.toString()}");
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

        // if (widget.titulo == "Busca un origen") {
        //   print("SE GUARDO EL ORIGIN");
        //   context
        //       .read<RouteLocationBloc>()
        //       .add(SetOriginCoordinates(lat: lat, lng: lng));

        //   setState(() {
        //     listOfLocation = [];
        //     searchController.text = description.length <= 26
        //         ? description
        //         : description.substring(0, 25);
        //   });
        // } else {
        //   print("SE GUARDO EL DESTINO");
        //   context
        //       .read<RouteLocationBloc>()
        //       .add(SetDestinationCoordinates(lat: lat, lng: lng));

        //   setState(() {
        //     listOfLocation = [];
        //     searchController.text = description.length <= 26
        //         ? description
        //         : description.substring(0, 25);
        //   });
        // }
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
    return Positioned(
      top: 30,
      left: 16,
      right: 16,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.directions_bus, color: Colors.grey[700]),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                  hintText: "Buscar por nombre"),
                              onChanged: (value) {},
                              focusNode: _focusNode,
                            ),
                            Visibility(
                                visible: searchController.text.isEmpty ||
                                        !focusActivo
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
                                          searchController.text =
                                              listOfLocation[index]
                                                          .Name
                                                          .length <=
                                                      26
                                                  ? listOfLocation[index].Name
                                                  : listOfLocation[index]
                                                      .Name
                                                      .substring(0, 25);
                                          _focusNode.unfocus();
                                          // getCoordinatesFromPlaceId(
                                          //     listOfLocation[index]["place_id"],
                                          //     listOfLocation[index]
                                          //         ["description"]);
                                        },
                                        child: ListTile(
                                          title: Text(listOfLocation[index]
                                                      .Name
                                                      .toString()
                                                      .length <
                                                  26
                                              ? listOfLocation[index].Name
                                              : listOfLocation[index]
                                                  .Name
                                                  .toString()
                                                  .substring(0, 25)),
                                        ),
                                      );
                                    }))
                          ],
                        ),
                      )
                    ],
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
