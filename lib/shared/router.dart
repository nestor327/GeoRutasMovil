import 'package:flutter/material.dart';
import 'package:georutasmovil/features/Auth/presentation/screens/SignInScreen.dart';
import 'package:georutasmovil/features/Auth/presentation/screens/SignUpScreen.dart';
import 'package:georutasmovil/features/Auth/presentation/screens/WelcomeScreen.dart';
import 'package:georutasmovil/features/Routes/presentation/screens/HomeScreen.dart';
import 'package:go_router/go_router.dart';

GoRouter RouterLocalConfig({required bool isAutenticated}) {
  return GoRouter(
      initialLocation: (isAutenticated) ? "/home" : "/welcome",
      errorBuilder: (contex, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Error")),
          body: const Center(child: Text("Pagina no encontrada")),
        );
      },
      routes: [
        GoRoute(
            path: "/welcome",
            builder: (contex, state) => const WelcomeScreen()),
        GoRoute(
            path: "/sign-in", builder: (contex, state) => const SignInScreen()),
        GoRoute(
            path: "/sign-up", builder: (contex, state) => const SignUpScreen()),
        GoRoute(path: "/home", builder: (contex, state) => const HomeScreen())
      ]);
}
