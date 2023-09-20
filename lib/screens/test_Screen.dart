import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('test'),
                  Expanded(child: ColoredBox(color: Colors.red)),
                  Expanded(child: ColoredBox(color: Colors.green))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
