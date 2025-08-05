import 'package:flutter/material.dart';
import '../components/custom_date_selector.dart';
import '../components/custom_gender_selector.dart';
import '../components/logo_header.dart';
import '../components/widget_button.dart';
import '../components/widget_textfield.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  int _gender = -1;
  DateTime? _selectedDate;

  void _onGenderSelected(int gender) {
    setState(() {
      _gender = gender;
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _onRegister() {
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');
    print('Gender: $_gender');
    print('Selected Date: $_selectedDate');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoHeader(),
              const SizedBox(height: 30),

              CustomTextField(
                controller: emailController,
                label: 'Email or Username',
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: passwordController,
                label: 'Password',
                obscure: true,
              ),
              const SizedBox(height: 24),

              GenderSelector(
                selectedGender: _gender,
                onChanged: _onGenderSelected,
              ),
              const SizedBox(height: 24),

              DateSelector(
                selectedDate: _selectedDate,
                onDateSelected: _onDateSelected,
              ),
              const SizedBox(height: 30),

              Center(
                child: CustomButton(
                  text: "Register",
                  textColor: Colors.white,
                  backgroundColor: Colors.teal,
                  onPressed: _onRegister,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
