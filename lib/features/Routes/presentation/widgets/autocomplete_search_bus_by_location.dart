import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:georutasmovil/features/Routes/domain/entities/get_bus_by_location_request.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';
import 'package:georutasmovil/shared/utils/env.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class AutocompleteSearchBusByLocation extends StatefulWidget {
  final VoidCallback onBusLocation;
  const AutocompleteSearchBusByLocation(
      {super.key, required this.onBusLocation});

  @override
  State<AutocompleteSearchBusByLocation> createState() =>
      _AutocompleteSearchBusByLocationState();
}

class _AutocompleteSearchBusByLocationState
    extends State<AutocompleteSearchBusByLocation> {
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
        setState(() {
          listOfLocation = [];
        });
        return;
      }
      String bassedUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json";

      String request =
          '$bassedUrl?input=$input&key=$apiKey&sessiontoken=$token';

      var response = await http.get(Uri.parse(request));

      if (response.statusCode == 200) {
        setState(() {
          listOfLocation = json.decode(response.body)['predictions'];
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

        setState(() {
          listOfLocation = [];
          searchController.text = description.length <= 26
              ? description
              : description.substring(0, 25);
        });
        context.read<RouteBloc>().add(GetBusesByLocationEvent(
            request: GetBusesByLocationRequest(
                RatioInMeters: 300,
                WeekDayId: DateTime.now().weekday,
                TimeZoneId: 1,
                Latitude: lat,
                Longitude: lng,
                Time: DateTime.now())));

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
              Row(children: [
                Icon(Icons.place, color: Colors.grey[700]),
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
                                hintText: "Buscar por ubicacion"),
                            onChanged: (value) {},
                            focusNode: _focusNode,
                          ),
                          Visibility(
                              visible:
                                  searchController.text.isEmpty || !focusActivo
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
                                            listOfLocation[index]
                                                ["description"]);
                                      },
                                      child: ListTile(
                                        title: Text(listOfLocation[index]
                                                        ["description"]
                                                    .toString()
                                                    .length <
                                                26
                                            ? listOfLocation[index]
                                                ["description"]
                                            : listOfLocation[index]
                                                    ["description"]
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: widget.onBusLocation,
                        icon: const Icon(Icons.my_location, size: 16),
                        label: Text("${focusActivo ? "" : "Mi ubicación"}",
                            style: TextStyle(fontSize: 12)),
                      ),
                    )
                  ],
                )),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
