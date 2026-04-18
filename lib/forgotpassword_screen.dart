import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 250, // Ensures it fills the rest of the screen
                ),
                width: double.infinity,
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
                          'Forgot Password',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 100),

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
                            const SizedBox(height: 100),

                            TextFormField(
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  isLoginTabSelected = true;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const OtpScreen()),
                                  );
                                });
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Sendmail',
                                hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                fillColor: Colors.orange,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
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
