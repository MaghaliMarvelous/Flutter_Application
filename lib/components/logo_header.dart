import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Welcome to the Register Page!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Please register using your email and password."),
          const SizedBox(height: 10),
          Image.asset(
            'assets/catpfptest.jpg',
            width: 100,
            height: 100,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
          ),
        ],
      ),
    );
  }
}