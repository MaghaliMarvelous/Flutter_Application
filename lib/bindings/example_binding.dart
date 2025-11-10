import 'package:flutter_application_pplg1_20/controllers/example_controller.dart';
import 'package:get/get.dart';

class ExampleBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ExampleController>(()=>ExampleController());
  }
  
}