import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // index aktif
  var selectedIndex = 0.obs;

  // method ganti index
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
