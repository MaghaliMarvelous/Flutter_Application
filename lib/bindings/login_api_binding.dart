import 'package:flutter_application_pplg1_20/controllers/login_api_controller.dart';
import 'package:get/get.dart';

class LoginApiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }
}