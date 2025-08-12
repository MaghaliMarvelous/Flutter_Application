import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/controllers/football_controller.dart';
import 'package:get/get.dart';

class EditFootballPage extends StatelessWidget {
  final int index;
  final FootballController footballController = Get.find();

  EditFootballPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final player = footballController.players[index];
    final nameController = TextEditingController(text: player.name);
    final positionController = TextEditingController(text: player.position);
    final numberController =
        TextEditingController(text: player.number.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Player",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(player.profileImage),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),


                TextField(
                  controller: positionController,
                  decoration: InputDecoration(
                    labelText: "Position",
                    prefixIcon: const Icon(Icons.sports_soccer),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Number",
                    prefixIcon: const Icon(Icons.numbers),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      footballController.players[index] = Player(
                        profileImage: player.profileImage,
                        name: nameController.text,
                        position: positionController.text,
                        number: int.tryParse(numberController.text) ??
                            player.number,
                      );
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                       foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
