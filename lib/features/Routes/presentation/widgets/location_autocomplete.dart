import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocationAutoComplete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LocationAutoCompleteState();
}

class LocationAutoCompleteState extends State<LocationAutoComplete> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 4),
              ],
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
                          decoration:
                              InputDecoration(hintText: "Busca un Lugar"),
                          onChanged: (value) {},
                        ),
                        Expanded(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Text("Location${index}"),
                                  );
                                })),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.my_location,
                                    color: Colors.green,
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
