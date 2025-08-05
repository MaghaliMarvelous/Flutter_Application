import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/components/widget_button.dart';
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
        child: SingleChildScrollView(
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
              SizedBox(height: 10),
              Center(
                child: Image.asset('assets/catpfptest.jpg', width: 100, height: 100),
              ),
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              Center(
                child: Column(
                  children: [
                    Container(

                      margin: EdgeInsets.only(top: 25),
                      child: CustomButton(
                        text: "Login",
                        textColor: Colors.cyan,
                        onPressed: () {
                          if (emailController.text == "admin" &&
                              passwordController.text == "admin") {
                            setState(() {
                              statuslogin = "Login successful!";
                              log(statuslogin);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
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
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: CustomButton(
                        text: "Register",
                        textColor: Colors.green,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Center(child: Text(statuslogin)),
            ],
          ),
        ),
      ),
    );
  }
}
