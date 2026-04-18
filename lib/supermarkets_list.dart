import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/home_screen.dart';
import 'package:kokozaki_app_project_1/notifications_screen.dart';
import 'package:kokozaki_app_project_1/settings_screen.dart';

import 'components/market_button.dart';

class SupermarketsList extends StatefulWidget {
  const SupermarketsList({super.key});

  @override
  State<SupermarketsList> createState() => _SupermarketsListState();
}

class _SupermarketsListState extends State<SupermarketsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Top Bar: Centered Logo and Notification Badge
                Row(
                  children: [
                    const Spacer(),
                    const Expanded(
                      flex: 8,
                      child: Image(
                        image: AssetImage('images/main_image.png'),
                        height: 80,
                      ),
                    ),
                     Expanded(
                      flex: 1,
                      child: Badge(
                        backgroundColor: Color(0xFF647BFF),
                        smallSize: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                            );
                          },
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 35,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Title and Filter Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'List of Supermarkets',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF647BFF),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                        },
                        child: const Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(child: MarketButton()),
                    SizedBox(width: 10),
                    Expanded(child: MarketButton()),
                    SizedBox(width: 10),
                    Expanded(child: MarketButton()),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(child: MarketButton()),
                    SizedBox(width: 10),
                    Expanded(child: MarketButton()),
                    SizedBox(width: 10),
                    Expanded(child: MarketButton()),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(child: MarketButton()),
                    SizedBox(width: 10),
                    Expanded(child: MarketButton()),
                    SizedBox(width: 10),
                    Expanded(child: MarketButton()),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Expanded(child: MarketButton()),
                    SizedBox(width: 10),
                    Expanded(child: MarketButton()),
                    SizedBox(width: 10),
                    Expanded(child: MarketButton()),
                  ],
                ),
                const SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: 37,
                    width: 137,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
