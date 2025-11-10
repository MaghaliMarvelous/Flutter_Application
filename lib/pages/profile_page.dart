import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/pages/login_api_page.dart';
import 'package:flutter_application_pplg1_20/routes/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.snackbar('Logout', 'Berhasil logout',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: const Color.fromRGBO(76, 175, 80, 1));
              Get.offAll(() => const LoginApiPage());
 // Ganti dengan halaman login kamu
            },
          ),
        ],
      ),
      body: Center(
        child: user == null
            ? const Text("Tidak ada pengguna yang login")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      user.photoURL ??
                          "https://via.placeholder.com/150", // fallback image
                    ),
                    backgroundColor: Colors.blueAccent[100],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    user.displayName ?? "Nama tidak tersedia",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user.email ?? "Email tidak tersedia",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
