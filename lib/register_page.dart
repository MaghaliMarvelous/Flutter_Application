import 'package:flutter/material.dart';
import 'components/custom_date_selector.dart';
import '../components/custom_text_field.dart';
import '../components/custom_gender_selector.dart';
import 'components/logo_header.dart';

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
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoHeader(),
              const SizedBox(height: 20),
              CustomTextField(controller: emailController, label: 'Email or Username'),
              const SizedBox(height: 10),
              CustomTextField(controller: passwordController, label: 'Password', obscure: true),
              const SizedBox(height: 20),
              GenderSelector(selectedGender: _gender, onChanged: _onGenderSelected),
              const SizedBox(height: 20),
              DateSelector(
              selectedDate: _selectedDate,
              onDateSelected: _onDateSelected,
          ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _onRegister,
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
