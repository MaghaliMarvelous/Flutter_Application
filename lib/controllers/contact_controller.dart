import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/helpers/db_helper.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  // store list of maps: [{id: 1, name: "John"}]
  final contacts = <Map<String, dynamic>>[].obs;
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  /// Ambil semua kontak dari database
  Future<void> fetchContacts() async {
    final data = await _dbHelper.getNames(); // expect list of maps
    contacts.value = data;
  }

  /// Tambah kontak baru
  Future<void> addContact() async {
    final text = nameController.text.trim();
    if (text.isEmpty) {
      _showError("Name cannot be empty!");
      return;
    }
    await _dbHelper.insertName(text);
    nameController.clear();
    await fetchContacts();
    _showSuccess("Contact added successfully");
  }

  /// Hapus kontak by id
  Future<void> deleteContact(int index) async {
    final id = contacts[index]['id'] as int;
    await _dbHelper.deleteById(id);   
    await fetchContacts();
    _showWarning("Contact removed");
  }

  /// Edit kontak by id
  Future<void> editContact(int index, String newName) async {
    if (newName.trim().isEmpty) {
      _showError("Name cannot be empty!");
      return;
    }
    final id = contacts[index]['id'] as int;
    await _dbHelper.updateById(id, newName.trim()); // ✅ use updateById
    await fetchContacts();
    _showSuccess("Contact updated successfully");
  }

  /// Helper snackbar
  void _showError(String msg) {
    Get.snackbar(
      "Error",
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.7),
      colorText: Colors.white,
    );
  }

  void _showSuccess(String msg) {
    Get.snackbar(
      "Success",
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: Colors.white,
    );
  }

  void _showWarning(String msg) {
    Get.snackbar(
      "Deleted",
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange.withOpacity(0.7),
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
