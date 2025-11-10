import 'package:flutter_application_pplg1_20/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';


class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }

}