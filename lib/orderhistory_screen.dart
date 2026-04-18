import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/components/textfield_button.dart';
import 'package:kokozaki_app_project_1/deliverytimes_screen.dart';
import 'package:kokozaki_app_project_1/notifications_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
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
                          'Order History',
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryTimesScreen()));
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
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF647BFF),
                  ),
                ),
                const SizedBox(height: 10),
                const TextFieldButton(),
                const SizedBox(height: 20),
                const Text(
                  'Working Hours',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF647BFF),
                  ),
                ),
                const SizedBox(height: 10),
                const TextFieldButton(),
                const SizedBox(height: 20),
                const Text(
                  'Delivery fee',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF647BFF),
                  ),
                ),
                const SizedBox(height: 10),
                const TextFieldButton(),
                const SizedBox(height: 20),
                const Text(
                  'Delivery type',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF647BFF),
                  ),
                ),
                const SizedBox(height: 10),
                const TextFieldButton(),
                const SizedBox(height: 40),
                const Divider(color: Colors.grey, thickness: 0.5),
                const SizedBox(height: 30),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque in nisi maximus, sodales ipsum eget, ornare quam. Phasellus sodales justo in cursus fermentum. Suspendisse tempus tincidunt purus vel euismod. ornare quam. Phasellus sodales justo in cursus fermentum. Suspendisse tempus tincidunt purus vel euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
