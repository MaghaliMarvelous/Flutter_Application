import 'package:get/get.dart';
import 'auth_controller.dart';
import 'login_api_controller.dart';
import 'notification_controller.dart';
import 'splashscreen_controller.dart';
import 'contact_controller.dart';

void initControllers() {
  Get.put(SplashscreenController());
  Get.put(ContactController());
  Get.put(AuthController());
  Get.put(LoginApiController());
  Get.put(NotificationController());
}
