import 'package:flutter/material.dart';
import 'package:project_kindergarden/features/startScreen/view/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'morasalati',
      home: StartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
