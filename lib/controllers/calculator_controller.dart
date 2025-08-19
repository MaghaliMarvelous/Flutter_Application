import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final txtAngka1 = TextEditingController();
  final txtAngka2 = TextEditingController();
  var hasil = "".obs;

  void tambah() {
    double a = double.tryParse(txtAngka1.text) ?? 0;
    double b = double.tryParse(txtAngka2.text) ?? 0;
    hasil.value = (a + b).toString();
  }

  void kurang() {
    double a = double.tryParse(txtAngka1.text) ?? 0;
    double b = double.tryParse(txtAngka2.text) ?? 0;
    hasil.value = (a - b).toString();
  }

  void kali() {
    double a = double.tryParse(txtAngka1.text) ?? 0;
    double b = double.tryParse(txtAngka2.text) ?? 0;
    hasil.value = (a * b).toString();
  }

  void bagi() {
    double a = double.tryParse(txtAngka1.text) ?? 0;
    double b = double.tryParse(txtAngka2.text) ?? 1;
    hasil.value = (b != 0) ? (a / b).toString() : "Error";
  }

  // 🔹 Clear method
  void clear() {
    txtAngka1.clear();
    txtAngka2.clear();
    hasil.value = "";
  }

  // 🔹 Show hasil (default = addition)
  void showHasil() {
    tambah(); // default behavior → addition
  }
}
