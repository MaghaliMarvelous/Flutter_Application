import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pplg1_20/pages/profile_page.dart';
import 'package:flutter_application_pplg1_20/routes/routes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../network/client_network.dart';
import '../pages/login_api_page.dart';

class LoginApiController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;
  var googleName = "".obs;
  var googleEmail = "".obs;
  var googlePhoto = "".obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
    loadGoogleData();
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Login', 'Username dan password harus diisi',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent);
      return;
    }

    isLoading.value = true;
    final url = Uri.parse("${ClientNetwork.baseUrl}/login");

    try {
      final response = await http.post(url, body: {
        "username": username,
        "password": password,
      }).timeout(const Duration(seconds: 15));

      final decoded = json.decode(response.body);
      final bool success = decoded['status'] == true;
      final String message = decoded['message']?.toString() ?? 'Login gagal';
      final String? token = decoded['token']?.toString();

      if (success && token != null && token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('token', token);
        await prefs.setString('username', username);

        Get.snackbar('Login', 'Login berhasil',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green);

        Get.offAll(() => const ProfilePage());

      } else {
        Get.snackbar('Login', message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      Get.snackbar('Login', 'Terjadi kesalahan: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      final prefs = await SharedPreferences.getInstance();
      googleName.value = googleUser.displayName ?? "";
      googleEmail.value = googleUser.email;
      googlePhoto.value = googleUser.photoUrl ?? "";

      await prefs.setString("google_name", googleName.value);
      await prefs.setString("google_email", googleEmail.value);
      await prefs.setString("google_photo", googlePhoto.value);
      await prefs.setBool("google_logged_in", true);

      Get.snackbar("Success", "Login Google sukses!");
      Get.offAll(() => const ProfilePage());
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();

    googleName.value = "";
    googleEmail.value = "";
    googlePhoto.value = "";

    Get.snackbar('Logout', 'Berhasil logout',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);

    Get.offAllNamed(AppRoutes.profile);
  }

  Future<void> loadGoogleData() async {
    final prefs = await SharedPreferences.getInstance();
    googleName.value = prefs.getString("google_name") ?? "";
    googleEmail.value = prefs.getString("google_email") ?? "";
    googlePhoto.value = prefs.getString("google_photo") ?? "";
  }
}
