import 'package:flutter/material.dart';
import 'package:phi_mobile_challenge/src/core/app_providers.dart';
import 'package:phi_mobile_challenge/src/features/details/router/detail_router.dart';
import 'package:phi_mobile_challenge/src/features/splash/router/splash_router.dart';
import 'package:phi_mobile_challenge/src/features/statement/router/statement_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phi Mobile Challenge',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashRouter(),
          "/user-balance": (context) => const StatementRouter(),
          "/detail": (context) => const DetailRouter(),
        },
      ),
    );
  }
}
