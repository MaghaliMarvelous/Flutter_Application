import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_pplg1_20/pages/calculator.page.dart';
import 'package:flutter_application_pplg1_20/pages/profile_page.dart';
import 'package:flutter_application_pplg1_20/pages/football_pages.dart';
import 'package:flutter_application_pplg1_20/controllers/bottom_nav_controller.dart';

class BottomNavPage extends StatelessWidget {
  BottomNavPage({Key? key}) : super(key: key);

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> _pages = [
    CalculatorPage(),
    FootballPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: "Calculator"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_soccer), label: "Players"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ));
  }
}
