import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/navbar/navbar.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavPage(), // 👈 start with navbar wrapper
    );
  }
}
