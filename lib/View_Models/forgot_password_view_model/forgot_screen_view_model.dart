import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotScreenViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  var isLoading = false.obs;

  Future<void> forgotPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        'Action Required',
        'Please enter your email to reset password',
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
        margin: const EdgeInsets.all(15),
        borderRadius: 15,
      );
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Invalid Email',
        'Please enter a valid email address',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.email_outlined, color: Colors.white),
        margin: const EdgeInsets.all(15),
        borderRadius: 15,
      );
      return;
    }

    try {
      isLoading.value = true;
      print("DEBUG: Sending reset email to $email...");
      
      await _auth.sendPasswordResetEmail(email: email);
      
      print("DEBUG: Reset email sent successfully.");
      isLoading.value = false;

      // Show success snackbar
      Get.snackbar(
        'Email Sent! 📧',
        'Check your inbox for a password reset link.',
        backgroundColor: const Color(0xFF647BFF),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(15),
        borderRadius: 15,
        duration: const Duration(seconds: 4),
      );
      
      // Delay navigation slightly so the snackbar has time to appear 
      // and isn't dismissed by the route popping.
      Future.delayed(const Duration(seconds: 1), () {
        Get.back(); 
      });

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      print("DEBUG: Firebase Error: ${e.code} - ${e.message}");
      Get.snackbar(
        'Error',
        e.message ?? 'An error occurred',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(15),
        borderRadius: 15,
      );
    } catch (e) {
      isLoading.value = false;
      print("DEBUG: Unexpected Error: $e");
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(15),
        borderRadius: 15,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
