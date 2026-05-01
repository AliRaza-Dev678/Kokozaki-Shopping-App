import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/view/login_screen/login_screen.dart';
import 'package:kokozaki_app_project_1/view/supermarkets_list_screen/supermarkets_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  void _checkUserStatus() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      // Check if user is already logged in
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // User is logged in, go to main screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const SupermarketsList()));
      } else {
        // User is not logged in, go to login screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Align(
          alignment: Alignment.center,
          child: Image(image: AssetImage('images/main_image.png'))),
    );
  }
}
