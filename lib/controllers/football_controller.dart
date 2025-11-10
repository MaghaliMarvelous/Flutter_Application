
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var isMobile = true.obs;

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
  var isMobile = true.obs; // <-- move it here

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
  ].obs;

  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
