import 'package:flutter/material.dart';
import 'package:flutter_application_1/modal/TodoScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}
