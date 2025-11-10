import 'package:flutter_application_pplg1_20/controllers/premire_table_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class PremierBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<PremireTableController>(PremireTableController());
  }
  
}