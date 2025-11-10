import 'package:flutter_application_pplg1_20/controllers/calculator_controller.dart';
import 'package:flutter_application_pplg1_20/controllers/football_controller.dart';
import 'package:flutter_application_pplg1_20/controllers/football_edit_controller.dart';
import 'package:get/get.dart';

class CalculatorBinding extends Bindings{
  @override
  void dependencies() { 
    Get.lazyPut<CalculatorController>(() => CalculatorController());
    Get.lazyPut<FootballController>(() => FootballController());
    Get.lazyPut<FootballEditController>(() => FootballEditController());
    //hanya dipanggil ketika dibutuhkan
  }}