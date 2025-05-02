import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:georutasmovil/shared/utils/env.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class LocationAutoComplete extends StatefulWidget {
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

      var data = json.decode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          listOfLocation = json.decode(response.body)['predictions'];
        });
      }
    } catch (e) {
      print(e.toString());
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
                        decoration: InputDecoration(hintText: "Busca un Lugar"),
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
                                  onTap: () {},
                                  child: ListTile(
                                    title: Text(
                                        listOfLocation[index]["description"]),
                                  ),
                                );
                              })),
                      Visibility(
                          visible: searchController.text.isEmpty ? true : false,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.blueAccent),
                                  padding: const WidgetStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6)),
                                  minimumSize:
                                      const WidgetStatePropertyAll(Size(0, 0)),
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
