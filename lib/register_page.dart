import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailorusernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int _gender = -1;
  List<DateTime?> _selectedDates = [DateTime.now()];

  void _handleRadioButton(int? value) {
    setState(() {
      _gender = value!;
    });
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      children: <Widget>[
        Radio(
          activeColor: const Color.fromARGB(255, 53, 53, 53),
          value: btnValue,
          groupValue: _gender,
          onChanged: _handleRadioButton,
        ),
        Text(title),
      ],
    );
  }

  Widget get _radioColumnContainer {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 15, 50, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Select your gender'),
          Row(
            children: <Widget>[
              addRadioButton(0, 'Male'),
              addRadioButton(1, 'Female'),
              addRadioButton(2, 'Others'),
            ],
          ),
        ],
      ),
    );
  }

  void _handleRegister() {
    final selectedDate = _selectedDates.first;
    print('Email: ${emailorusernameController.text}');
    print('Password: ${passwordController.text}');
    print('Gender: $_gender');
    print('Selected Date: $selectedDate');
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
              Center(
                child: Text(
                  "Welcome to the Register Page!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(child: Text("Please register using your email and password.")),
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/catpfptest.jpg',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailorusernameController,
                decoration: const InputDecoration(labelText: 'Email or Username'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              _radioColumnContainer,
              const SizedBox(height: 20),
              const Text("Select your date of birth:"),
              const SizedBox(height: 5),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                  selectedDayHighlightColor: const Color.fromARGB(255, 60, 60, 60),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ),
                value: _selectedDates,
                onValueChanged: (dates) => setState(() => _selectedDates = dates),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _handleRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text("Register", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
