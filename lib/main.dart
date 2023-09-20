import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/utils/route_names.dart';
import 'package:aiapait/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 40,
              color: Color(AppColors.black),
            ),
            bodySmall: TextStyle(color: Color(AppColors.black), fontSize: 10)),
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Color(AppColors.bgColor)),
        useMaterial3: true,
      ),
      initialRoute: RouteNames.homeScreen,
      onGenerateRoute: Routes.getRoute,
    );
  }
}
