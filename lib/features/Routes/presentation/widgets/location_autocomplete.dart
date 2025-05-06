import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routelocations/route_locations_bloc.dart';
import 'package:georutasmovil/shared/utils/env.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class LocationAutoComplete extends StatefulWidget {
  final String titulo;
  const LocationAutoComplete({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LocationAutoCompleteState();
}

class LocationAutoCompleteState extends State<LocationAutoComplete> {
  final searchController = TextEditingController();
  final String token = '1234567890';
  var uuid = const Uuid();
  List<dynamic> listOfLocation = [];
  @override
  void initState() {
    searchController.addListener(() {
      _onChange();
    });
    super.initState();
  }

  _onChange() {
    placeSuggestion(searchController.text);
  }

  void placeSuggestion(String input) async {
    String apiKey = EnvConfig.mapApyKey;

    try {
      if (input.isEmpty || input.length <= 3) {
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

  Future<void> getCoordinatesFromPlaceId(String placeId) async {
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
          context
              .read<RouteLocationBloc>()
              .add(SetOriginCoordinates(lat: 29.5603, lng: -95.0937));
        } else {
          context
              .read<RouteLocationBloc>()
              .add(SetDestinationCoordinates(lat: 29.7499, lng: -95.3584));
        }

        print('Latitude: $lat, Longitude: $lng');
      } else {
        print('API error: ${data['status']} - ${data['error_message']}');
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    // _showDestinationField = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(hintText: widget.titulo),
                        onChanged: (value) {},
                      ),
                      Visibility(
                          visible: searchController.text.isEmpty ? false : true,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: listOfLocation.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print("Se le dio clcik a la opcion");
                                    getCoordinatesFromPlaceId(
                                        listOfLocation[index]["place_id"]);
                                  },
                                  child: ListTile(
                                    title: Text(
                                        listOfLocation[index]["description"]),
                                  ),
                                );
                              })),
                      Visibility(
                          visible: searchController.text.isEmpty ? true : false,
                          child: Container(
                            margin: EdgeInsets.only(top: 1),
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.blueAccent),
                                  padding: WidgetStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4)),
                                  minimumSize:
                                      WidgetStatePropertyAll(Size(0, 0)),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.my_location,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "My Location",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    )
                                  ],
                                )),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
