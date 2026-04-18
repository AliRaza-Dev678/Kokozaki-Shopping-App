import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/components/deliverytime_button.dart';
import 'package:kokozaki_app_project_1/notifications_screen.dart';

class DeliveryTimesScreen extends StatefulWidget {
  const DeliveryTimesScreen({super.key});

  @override
  State<DeliveryTimesScreen> createState() => _DeliveryTimesScreenState();
}

class _DeliveryTimesScreenState extends State<DeliveryTimesScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Delivery Times',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Badge(
                      backgroundColor: const Color(0xFF647BFF),
                      smallSize: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationsScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: selectedIndex == 1
                                ? const Color(0xFF647BFF)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Market info',
                              style: TextStyle(
                                color: selectedIndex == 1
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: selectedIndex == 2
                                ? const Color(0xFF647BFF)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Delivery times',
                              style: TextStyle(
                                color: selectedIndex == 2
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                DeliveryTimeButton(),
                const SizedBox(height: 10),
                DeliveryTimeButton(),
                const SizedBox(height: 10),
                DeliveryTimeButton(),
                const SizedBox(height: 10),
                DeliveryTimeButton(),
                const SizedBox(height: 10),
                DeliveryTimeButton(),
                const SizedBox(height: 10),
                DeliveryTimeButton(),
                const SizedBox(height: 10),
                DeliveryTimeButton(),
                const SizedBox(height: 10),
                DeliveryTimeButton(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
