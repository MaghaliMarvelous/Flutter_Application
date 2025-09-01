import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_pplg1_20/controllers/football_edit_controller.dart';

class EditFootballPage extends StatelessWidget {
  EditFootballPage({super.key});

  final FootballEditController editController =
      Get.put(FootballEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Player"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() => TextField(
                  decoration: const InputDecoration(labelText: "Player Name"),
                  // langsung pakai value dari controller
                  controller: TextEditingController(
                    text: editController.playerName.value,
                  ),
                  onChanged: (val) => editController.playerName.value = val,
                )),
            const SizedBox(height: 12),
            Obx(() => TextField(
                  decoration: const InputDecoration(labelText: "Position"),
                  controller: TextEditingController(
                    text: editController.playerPosition.value,
                  ),
                  onChanged: (val) => editController.playerPosition.value = val,
                )),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                editController.savePlayer();
                Get.back();
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
