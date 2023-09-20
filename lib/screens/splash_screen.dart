import 'dart:async';
import 'package:aiapait/utils/route_names.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Color> colorList = [
    Colors.deepPurple,
    Colors.deepPurple,
    Colors.purple[300]!,
    Colors.purple[300]!,
    Colors.deepPurple,
    Colors.deepPurple,
  ];
  int index = 0;
  Color leftColor = Colors.deepPurple;
  Color rightColor = Colors.deepPurple;
  Alignment begin = Alignment.centerLeft;
  Alignment end = Alignment.centerRight;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        index = (index + 1) % colorList.length;
        leftColor = colorList[index];
        rightColor = colorList[(index + 1) % colorList.length];
      });
    });
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RouteNames.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end,
                colors: [leftColor, rightColor],
              ),
            ),
          ),
          const Center(
            child: Text(
              'Lorem Impsum',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
