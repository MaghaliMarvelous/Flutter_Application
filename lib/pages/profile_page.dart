import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://a.pinatafarm.com/480x480/d3148bf3a1/man-talking-to-wall.jpg", 
              ),
              backgroundColor: Colors.blue[100],
            ),
            
            const SizedBox(height: 20),
            
            // Name Text
            const Text(
              'Maghali Arka Nugraha', 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 5),
            
            // Optional subtitle
            Text(
              '11 PPLG 1, Absen 20',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
