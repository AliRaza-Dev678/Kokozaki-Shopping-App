import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/forgotpassword_screen.dart';
import 'package:kokozaki_app_project_1/signup_screen.dart';
import 'package:kokozaki_app_project_1/supermarkets_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool isUsernameSelected = true;
  bool isLoginTabSelected = true;

  @override
  void dispose() {
    _usernameFocusNode.dispose();
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
              Container(
                child: const Image(image: AssetImage('images/main_image.png')),
              ),
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
                      const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(child: Text('Welcome back to us!',style: TextStyle(fontSize: 15,color: Colors.white),)),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  isUsernameSelected = true;
                                });
                                _usernameFocusNode.requestFocus();
                              },
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Username',
                                fillColor: isUsernameSelected ? Colors.orange : Colors.transparent,
                                filled: isUsernameSelected,
                                hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  isUsernameSelected = false;
                                });
                                _passwordFocusNode.requestFocus();
                              },
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                fillColor: !isUsernameSelected ? Colors.orange : Colors.transparent,
                                filled: !isUsernameSelected,
                                hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Username',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              focusNode: _usernameFocusNode,
                              decoration: InputDecoration(
                                hintText: 'qwqwqd',
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
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              focusNode: _passwordFocusNode,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'qwqwqd',
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: const Icon(Icons.visibility, color: Color(0xFF1B5E6E)),
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
                                  MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  isLoginTabSelected = true;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SupermarketsList()),
                                  );
                                });
                              },
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Login',
                                hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                fillColor: isLoginTabSelected ? Colors.orange : Colors.transparent,
                                filled: isLoginTabSelected,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  isLoginTabSelected = false;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                                );
                              },
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Sign up',
                                hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                fillColor: !isLoginTabSelected ? Colors.orange : Colors.transparent,
                                filled: !isLoginTabSelected,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
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
