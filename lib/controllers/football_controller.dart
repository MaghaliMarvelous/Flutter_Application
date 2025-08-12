
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Player {
  final String profileImage;
  final String name;
  final String position;
  final int number;

  Player({
    required this.profileImage,
    required this.name,
    required this.position,
    required this.number,
  });
}

class FootballController extends GetxController {
  final players = <Player>[
    Player(
      profileImage: 'assets/harry_kane.jpeg',
      name: 'Harry Kane',
      position: 'Forward',
      number: 9,
    ),
    Player(
      profileImage: 'assets/thomasmuller.jpg',
      name: 'Thomas Muller',
      position: 'Midfielder',
      number: 25,
    ),
    Player(
      profileImage: 'assets/leroy sane.jpg',
      name: 'Leroy Sane',
      position: 'Left Midfielder',
      number: 10,
    ),
    Player(
      profileImage: 'assets/delight.jpg',
      name: 'Matthaus de Ligt',
      position: 'Right Center Back',
      number: 4,
    ),
    Player(
      profileImage: 'assets/neueer.jpg',
      name: 'Manuel Neuer',
      position: 'Goalkeeper',
      number: 1,
    ),
  ].obs; // <-- This makes the list reactive
}
