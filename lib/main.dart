import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/login_page.dart';
import 'package:flutter_application_pplg1_20/pages/calculator.page.dart';
import 'package:get/get_navigation/get_navigation.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CalculatorPage(),
    );
  }
}

