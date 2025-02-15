import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? child;

  const CustomScaffold({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/backgroundScreen.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: child!,
          )
        ],
      ),
    );
  }
}
