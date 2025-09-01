import 'package:get/get.dart';
import 'football_controller.dart';

class FootballEditController extends GetxController {
  late RxString playerName;
  late RxString playerPosition;
  late int editingIndex;

  late FootballController footballController;

  @override
  void onInit() {
    super.onInit();

    footballController = Get.find<FootballController>();


    final args = Get.arguments;
    editingIndex = args["index"];

    final player = footballController.players[editingIndex];
    playerName = player.name.obs;
    playerPosition = player.position.obs;
  }

  void savePlayer() {
    final oldPlayer = footballController.players[editingIndex];

    final updatedPlayer = Player(
      name: playerName.value,
      position: playerPosition.value,
      number: oldPlayer.number,
      profileImage: oldPlayer.profileImage,
    );

    footballController.players[editingIndex] = updatedPlayer;
    footballController.players.refresh();
  }
}
