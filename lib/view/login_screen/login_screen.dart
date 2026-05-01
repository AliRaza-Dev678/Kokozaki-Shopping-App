import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kokozaki_app_project_1/View_Models/login_screen_view_model/login_screen_view_model.dart';
import 'package:kokozaki_app_project_1/view/forgot_password_screen/forgotpassword_screen.dart';
import 'package:kokozaki_app_project_1/view/signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool isEmailSelected = true;

  // ✅ FIX: Declare late, initialize safely in initState
  late final LoginScreenViewModel loginScreenViewModel;

  @override
  void initState() {
    super.initState();
    // ✅ FIX: Reuse existing instance if already registered, else create new
    loginScreenViewModel = Get.isRegistered<LoginScreenViewModel>()
        ? Get.find<LoginScreenViewModel>()
        : Get.put(LoginScreenViewModel());
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Image(image: AssetImage('images/main_image.png')),
              const SizedBox(height: 50),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF647BFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Welcome back to us!',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      // Top Toggles
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() => isEmailSelected = true);
                                _emailFocusNode.requestFocus();
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isEmailSelected
                                      ? Colors.orange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() => isEmailSelected = false);
                                _passwordFocusNode.requestFocus();
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: !isEmailSelected
                                      ? Colors.orange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: loginScreenViewModel.emailController,
                              focusNode: _emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Enter email',
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Password:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: loginScreenViewModel.passwordController,
                              focusNode: _passwordFocusNode,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter password',
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: const Icon(Icons.visibility_off,
                                    color: Color(0xFF1B5E6E)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ForgotPasswordScreen()),
                                );
                              },
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Login Button
                            Obx(() => InkWell(
                              onTap: loginScreenViewModel.isLoading.value
                                  ? null
                                  : () {
                                loginScreenViewModel.login();
                              },
                              child: Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: loginScreenViewModel.isLoading.value
                                      ? const CircularProgressIndicator(
                                      color: Colors.white)
                                      : const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            )),
                            const SizedBox(height: 15),
                            // Switch to Signup
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignupScreen()),
                                );
                              },
                              child: Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}