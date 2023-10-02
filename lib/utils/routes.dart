import 'package:aiapait/bloc/login/login_bloc.dart';
import 'package:aiapait/cubit/signup_cubit.dart';
import 'package:aiapait/screens/forgot_password_screen.dart';
import 'package:aiapait/screens/home_screen.dart';
import 'package:aiapait/screens/login_screen_two.dart';
import 'package:aiapait/screens/signup_screen_two.dart';
import 'package:aiapait/screens/splash_screen.dart';
import 'package:aiapait/utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteNames.loginScreenTwo:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginScreenTwo(),
          ),
        );
      case RouteNames.signupScreenTwo:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => SignupCubit(),
            child: const SignUpScreenTwo(),
          ),
        );
      // case RouteNames.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const LoginScreen(),
      //   );
      // case RouteNames.testScreen:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const TestScreen(),
      //   );
      // case RouteNames.signupScreen:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const SignUpScreen(),
      //   );
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
