import 'package:flutter/material.dart';
import 'package:georutasmovil/features/Routes/presentation/widgets/autocomplete_text_field.dart';

class CompactSearchBox extends StatelessWidget {
  final VoidCallback onMyLocationOrigen;
  final VoidCallback onMyLocationDestino;

  const CompactSearchBox({
    required this.onMyLocationOrigen,
    required this.onMyLocationDestino,
    super.key,
  });

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
              _buildSearchRow(
                icon: Icons.place,
                label: "Busca un origen",
                onTap: onMyLocationOrigen,
              ),
              const Divider(),
              _buildSearchRow(
                icon: Icons.flag,
                label: "Busca un destino",
                onTap: onMyLocationDestino,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchRow({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Expanded(
            child: AutocompleteTextField(
          titulo: label,
          onTap: onTap,
        )),
        // ElevatedButton.icon(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.blueAccent,
        //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //   ),
        //   onPressed: onTap,
        //   icon: const Icon(Icons.my_location, size: 16),
        //   label: const Text("Mi ubicación", style: TextStyle(fontSize: 12)),
        // ),
      ],
    );
  }
}
