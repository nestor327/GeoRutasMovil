import 'package:flutter/material.dart';
import 'package:georutasmovil/features/Auth/presentation/screens/SignInScreen.dart';
import 'package:georutasmovil/features/Auth/presentation/screens/SignUpScreen.dart';
import 'package:georutasmovil/features/Auth/presentation/widgets/CustomScaffold.dart';
import 'package:georutasmovil/features/Auth/presentation/widgets/WelcomeButtom.dart';
import 'package:georutasmovil/theme/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "Bienvenido de vuelta\n",
                          style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                        text: "\nIngrese sus credenciales",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ]),
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    const Expanded(
                      child: WelcomeButton(
                        buttonText: 'Sign in',
                        onTap: SignInScreen(),
                        color: Colors.transparent,
                        textColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: WelcomeButton(
                        buttonText: 'Sign up',
                        onTap: const SignUpScreen(),
                        color: Colors.white,
                        textColor: lightColorScheme.primary,
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
