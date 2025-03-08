import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Auth/presentation/bloc/User/user_bloc.dart';

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
        body: BlocBuilder<UserBloc, UserState>(
          builder: (contex, state) {
            switch (state) {
              case UserInitial():
                return Stack(
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
                );
              default:
                return const Text("Unkwoun state");
            }
          },
        ));
  }
}
