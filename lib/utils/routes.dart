import 'package:aiapait/screens/forgot_password_screen.dart';
import 'package:aiapait/screens/home_screen.dart';
import 'package:aiapait/screens/login_screen.dart';
import 'package:aiapait/screens/signup_screen.dart';
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
      case RouteNames.signupScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpScreen(),
        );
      case RouteNames.forgotpasswordScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPasswordScreen(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
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
