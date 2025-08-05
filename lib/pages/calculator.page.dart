import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/components/widget_textfield.dart';
import 'package:flutter_application_pplg1_20/components/widget_button.dart';
import 'package:flutter_application_pplg1_20/controllers/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Calculator"),),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(controller: calculatorController.txtAngka1, label: "input angka 1"),
            CustomTextField(controller: calculatorController.txtAngka2, label: "input angka 2"),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomButton(text: "+", textColor: Colors.blue, onPressed: () {
                    calculatorController.tambah();
                  },),
                  CustomButton(text: "-", textColor: Colors.blue, onPressed: () {
                    
                  },),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomButton(text: "X", textColor: Colors.blue, onPressed: () {
                    
                  },),
                  CustomButton(text: "/", textColor: Colors.blue, onPressed: () {
                    
                  },),
                ],
              ),
            ),
            // render UI berada di wrap OBX
            Obx(() => Text("Hasil "+calculatorController.hasil.value)),
            CustomButton(text: "Clear", textColor: Colors.green, onPressed: () {
              
            }, )
      
          ],
        ),
      ),
    );
  }
}