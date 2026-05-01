import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kokozaki_app_project_1/view/login_screen/login_screen.dart';

class SignupScreenViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> signup() async {
    String name = fullNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Action Required',
        'Please fill in all details to continue',
      );
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        'Invalid Email',
        'Double check your email format',
      );
      return;
    }

    if (password.length < 8) {
      Get.snackbar(
        'Security Check',
        'Password must be at least 8 characters long',
      );
      return;
    }

    try {
      isLoading.value = true;
      
      // 1. Create user in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      // 2. Save additional user data in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'fullName': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      
      isLoading.value = false;
      Get.offAll(() => const LoginScreen());
      Get.snackbar(
        'Success',
        'Account created successfully. Please login to continue.',
      );

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      String message = 'Signup failed';
      if (e.code == 'email-already-in-use') {
        message = 'This email is already registered.';
      } else {
        message = e.message ?? 'An error occurred.';
      }
      Get.snackbar(
        'Error',
        message,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
      );
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
