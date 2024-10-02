// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kindergarden/features/startScreen/view/start.dart';

import 'features/Auth/view/student/studentlogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'morasalati',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      // home: const StartScreen(),
      home: const StudentLoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
