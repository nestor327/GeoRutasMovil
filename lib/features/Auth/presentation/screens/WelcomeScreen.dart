import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/features/Auth/domain/entities/Refresh_token_request.dart';
import 'package:georutasmovil/features/Auth/domain/entities/user_sign_in_request.dart';
import 'package:georutasmovil/features/Auth/presentation/bloc/User/user_bloc.dart';
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
                    TextButton.icon(
                      onPressed: () => {
                        context.read<UserBloc>().add(RefreshTokenEvent(
                            refreshTokenRequest: UserRefreshTokenRequest(
                                AccessToken: "AccessToken",
                                RefreshToken: "RefreshToken")))
                      },
                      label: Text("Que pedo"),
                    ),
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
