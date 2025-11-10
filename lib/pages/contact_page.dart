import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_pplg1_20/controllers/contact_controller.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: Column(
        children: [
          // Input + Save button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      labelText: "Enter name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: controller.addContact,
                  child: const Text("Save"),
                ),
              ],
            ),
          ),

          // List contacts
          Expanded(
            child: Obx(() {
              if (controller.contacts.isEmpty) {
                return const Center(
                  child: Text("No contacts yet."),
                );
              }
              return ListView.builder(
                itemCount: controller.contacts.length,
                itemBuilder: (context, index) {
                  final contact = controller.contacts[index];
                  return Card(
                    child: ListTile(
                      title: Text(contact['name']), // ✅ show name
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit button with dialog
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              final TextEditingController editController =
                                  TextEditingController(
                                      text: contact['name']);

                              Get.dialog(
                                AlertDialog(
                                  title: const Text("Edit Contact"),
                                  content: TextField(
                                    controller: editController,
                                    decoration: const InputDecoration(
                                      labelText: "Name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.editContact(
                                            index, editController.text);
                                        Get.back();
                                      },
                                      child: const Text("Save"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          // Delete button
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => controller.deleteContact(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
