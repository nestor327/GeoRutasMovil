import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/di.dart';
import 'package:georutasmovil/features/Auth/presentation/screens/WelcomeScreen.dart';
import 'package:georutasmovil/features/coodinates/presentation/bloc/getCoordinates/GetCoordinatesBloc.dart';
import 'package:georutasmovil/theme/theme.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance<GetCoordinatesBloc>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightMode,
        home: const WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
