import 'package:flutter/material.dart';

class SearchPanel extends StatefulWidget {
  const SearchPanel({super.key});

  @override
  State<SearchPanel> createState() => _SearchPanelState();
}

class _SearchPanelState extends State<SearchPanel> {
  bool _showDestinationField = false;

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
                      _showDestinationField = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.blue),
                        SizedBox(width: 10),
                        Text("Punto de inicio", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                if (_showDestinationField)
                  const Divider(height: 1, color: Colors.grey),
                if (_showDestinationField)
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: const [
                        Icon(Icons.flag, color: Colors.redAccent),
                        SizedBox(width: 10),
                        Text("Destino", style: TextStyle(fontSize: 16)),
                      ],
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
