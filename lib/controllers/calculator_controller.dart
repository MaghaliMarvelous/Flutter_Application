import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController{
  final txtAngka1 = TextEditingController();
  final txtAngka2 = TextEditingController();
  var hasil = "".obs;

  void tambah(){
    int angka1 = int.parse(txtAngka1.text.toString());
    int angka2 = int.parse(txtAngka2.text.toString());
    
    int hasilJumlah = angka1+angka2;
    print("hasil tambah "+hasilJumlah.toString());
    hasil.value = hasilJumlah.toString();

  }

}