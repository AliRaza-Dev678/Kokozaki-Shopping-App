import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kokozaki_app_project_1/view/login_screen/login_screen.dart';
import 'package:kokozaki_app_project_1/view/supermarkets_list_screen/supermarkets_list.dart';

class LoginScreenViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Action Required',
        'Please enter your email and password',
      );
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Invalid Email',
        'Please check your email format',
      );
      return;
    }

    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      
      // Update last login timestamp in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
      });

      isLoading.value = false;
      Get.offAll(() => const SupermarketsList());
      
      Get.snackbar(
        'Success',
        'You have logged in successfully.',
      );

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      String message = 'Login failed';
      
      if (e.code == 'invalid-credential' || e.code == 'user-not-found' || e.code == 'wrong-password') {
        message = 'Wrong email or password. Please try again.';
      } else if (e.code == 'network-request-failed') {
        message = 'No internet connection detected.';
      } else {
        message = e.message ?? 'An unknown error occurred.';
      }

      Get.snackbar(
        'Login Error',
        message,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
      );
    }
  }

  // LOGOUT LOGIC
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(() => const LoginScreen());
    Get.snackbar(
      'Logged Out',
      'You have been logged out safely.',
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
