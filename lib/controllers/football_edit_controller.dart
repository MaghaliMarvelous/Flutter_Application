import 'package:get/get.dart';

class FootballEditController extends GetxController {
  // Contoh data pemain
  var playerName = ''.obs;
  var playerPosition = ''.obs;

  // Inisialisasi data pemain yang akan diedit
  void setPlayerData(String name, String position) {
    playerName.value = name;
    playerPosition.value = position;
  }

  // Simpan perubahan data pemain
  void savePlayerData() {
    // Lakukan proses update data di database atau state
    // Setelah itu kembali ke halaman list
    Get.back();
  }
}