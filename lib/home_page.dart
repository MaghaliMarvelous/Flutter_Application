import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController angkaPertamaController = TextEditingController();
  TextEditingController angkaKeduaController = TextEditingController();
  String hasil = "0";

  void showEmptyWarning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Masukkan angka pertama dan kedua terlebih dahulu"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: angkaPertamaController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: "First Number",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: angkaKeduaController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: "Second Number",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // 2x2 Operator Buttons
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.5,
                children: [
                  _buildOperatorButton("+"),
                  _buildOperatorButton("-"),
                  _buildOperatorButton("×"),
                  _buildOperatorButton("÷"),
                ],
              ),

              Divider(height: 30, thickness: 1, color: Colors.grey),

              Text(
                "Hasil:",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                hasil,
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // Reset button
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (angkaPertamaController.text.isEmpty &&
                        angkaKeduaController.text.isEmpty) {
                      showEmptyWarning();
                      return;
                    }
                    setState(() {
                      angkaPertamaController.clear();
                      angkaKeduaController.clear();
                      hasil = "0";
                    });
                  },
                  child: Text("Reset"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOperatorButton(String operator) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade50,
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        if (angkaPertamaController.text.isEmpty ||
            angkaKeduaController.text.isEmpty) {
          showEmptyWarning();
          return;
        }

        int a = int.parse(angkaPertamaController.text);
        int b = int.parse(angkaKeduaController.text);

        setState(() {
          switch (operator) {
            case "+":
              hasil = (a + b).toString();
              break;
            case "-":
              hasil = (a - b).toString();
              break;
            case "×":
              hasil = (a * b).toString();
              break;
            case "÷":
              if (b != 0) {
                hasil = (a / b).toStringAsFixed(2);
              } else {
                hasil = "Error (÷0)";
              }
              break;
          }
        });
      },
      child: Text(operator),
    );
  }
}
