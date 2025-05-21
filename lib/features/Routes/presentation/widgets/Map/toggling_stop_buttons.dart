import 'package:flutter/material.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/buses/buses_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TogglingStopButtons extends StatefulWidget {
  const TogglingStopButtons({Key? key}) : super(key: key);

  @override
  State<TogglingStopButtons> createState() => _TogglingStopButtonsState();
}

class _TogglingStopButtonsState extends State<TogglingStopButtons> {
  bool isFirstToggled = false;
  bool isSecondToggled = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          width: screenSize.width * 0.33,
          constraints: BoxConstraints(
            maxHeight: screenSize.height * 0.4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildToggleButton(
                icon: (isFirstToggled)
                    ? Icons.directions_off
                    : Icons.directions_bus,
                color: Colors.green,
                toggled: isFirstToggled,
                onPressed: () {
                  setState(() {
                    isFirstToggled = !isFirstToggled;
                    context.read<BusesBloc>().add(
                        SetShowBusStopsLocationFieldEvent(
                            isSecondToggled, isFirstToggled));
                  });
                },
              ),
              _buildToggleButton(
                icon: (isSecondToggled)
                    ? Icons.directions_off
                    : Icons.directions_bus,
                color: Colors.blue,
                toggled: isSecondToggled,
                onPressed: () {
                  setState(() {
                    isSecondToggled = !isSecondToggled;
                    context.read<BusesBloc>().add(
                        SetShowBusStopsLocationFieldEvent(
                            isSecondToggled, isFirstToggled));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton({
    required IconData icon,
    required Color color,
    required bool toggled,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        minimumSize: Size(40, 40),
      ),
      onPressed: onPressed,
      child: Icon(icon, size: 20, color: Colors.white),
    );
  }
}
