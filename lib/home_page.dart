import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/pages/calculator.page.dart';
import 'package:flutter_application_pplg1_20/pages/football_pages.dart';
import 'package:flutter_application_pplg1_20/pages/premier_table_page.dart';
import 'package:flutter_application_pplg1_20/pages/profile_page.dart';
import 'package:flutter_application_pplg1_20/pages/contact_page.dart';
import 'package:flutter_application_pplg1_20/pages/example_page.dart';
import 'package:flutter_application_pplg1_20/pages/notification_page.dart';
import 'package:flutter_application_pplg1_20/sidebar/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages =  [
    ProfilePage(),
    FootballPage(),
    CalculatorPage(),
    ContactPage(),
    ExamplePage(),
    NotificationPage(),
    PremierTablePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Menu")),
      drawer: SideBar(onItemTap: _onItemTap),
      body: _pages[_selectedIndex],
    );
  }
}
