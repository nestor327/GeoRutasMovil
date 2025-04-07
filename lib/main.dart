import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:georutasmovil/di.dart';
import 'package:georutasmovil/features/Auth/data/datasources/user_remote_data_source.dart';
import 'package:georutasmovil/features/Auth/data/models/user_token_credentials_model.dart';
import 'package:georutasmovil/features/Auth/data/repositories/user_repository_impl.dart';
import 'package:georutasmovil/features/Auth/domain/entities/Refresh_token_request.dart';
import 'package:georutasmovil/features/Auth/presentation/bloc/user/user_bloc.dart';
import 'package:georutasmovil/features/Routes/presentation/bloc/routes/route_bloc.dart';
import 'package:georutasmovil/features/coodinates/presentation/bloc/getCoordinates/GetCoordinatesBloc.dart';
import 'package:georutasmovil/shared/router.dart';
import 'package:georutasmovil/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/Auth/data/datasources/user_local_data_source.dart';

void main() async {
  await init();
  await Hive.initFlutter();
  await Hive.openBox<String>('userTokens');

  bool result = await checkIfAuthenticated();
  print("El valor de es autenticado es " + result.toString());
  runApp(MyApp(isAuthenticated: result));
}

Future<bool> checkIfAuthenticated() async {
  final userLocalDataSourc = HiveUserLocalDataSourceImpl();
  final userRemoteDataSource = UserRemoteDataSourceImpl();

  var userRepository = UserRepositoryImpl(
      userLocalDataSource: userLocalDataSourc,
      userRemoteDataSource: userRemoteDataSource);

  final data = await userRepository.GetUserTokensCredential();
  return data.fold((_) => false, (credentials) async {
    return (await userRepository.RefreshToken(UserRefreshTokenRequest(
            AccessToken: credentials.AccessToken,
            RefreshToken: credentials.RefreshToken)))
        .fold((_) => false, (tokens) async {
      return (await userRepository.SetUserTokensCredential(
              UserTokenCredentialsModel.fromEntity(tokens)))
          .fold((_) => false, (_) => true);
    });
  });
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;
  const MyApp({super.key, required this.isAuthenticated});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance<GetCoordinatesBloc>()),
        BlocProvider(create: (_) => GetIt.instance<UserBloc>()),
        BlocProvider(create: (_) => GetIt.instance<RouteBloc>())
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: lightMode,
        routerConfig: RouterLocalConfig(isAutenticated: isAuthenticated),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
