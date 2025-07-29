import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/home_Page.dart';
import 'dart:developer';

import 'package:flutter_application_pplg1_20/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String statuslogin = "Login status";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Welcome to the Login Page!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(child: Text("Please login using your email and password.")),
            //image dari resources
            SizedBox(height: 10),
            Center(
              child: Image.asset('assets/catpfptest.jpg', width: 100, height: 100),
            ),
            //buatlah isian username dan password
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true, // untuk menyembunyikan karakter password
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                border: OutlineInputBorder(),
              ),
            ),
            //button login
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text == "admin" &&
                        passwordController.text == "admin") {
                      setState(() {
                        statuslogin = "Login successful!";
                        log(statuslogin);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage()
                          ),
                        );
                      });
                    } else {
                      setState(() {
                        statuslogin = "Login Failed!";
                        log(statuslogin);
                      });
                    }
                  },
                  child: Text("Login"),
                  
                ),
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => RegisterPage()
                    ),
                  );
                },
                child: Text(
                  "Don't have any account? Register!",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 30, 30, 30),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Container(
               margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  statuslogin
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}