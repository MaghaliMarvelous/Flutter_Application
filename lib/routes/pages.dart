
import 'package:flutter_application_pplg1_20/pages/football_edit_page.dart';
import 'package:flutter_application_pplg1_20/pages/football_pages.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_application_pplg1_20/routes/routes.dart';
import 'package:flutter_application_pplg1_20/pages/calculator.page.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
    GetPage(
    name: AppRoutes.footballeditplayers,
    page: () => EditFootballPage(index: Get.arguments),
    ),

  ];
}
