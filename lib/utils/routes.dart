import 'package:aiapait/screens/login_screen.dart';
import 'package:aiapait/screens/splash_screen.dart';
import 'package:aiapait/screens/test_Screen.dart';
import 'package:aiapait/utils/route_names.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RouteNames.testScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TestScreen(),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          );
        });
    }
  }
}
