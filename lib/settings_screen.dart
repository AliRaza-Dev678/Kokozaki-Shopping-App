import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/accountsettings.dart';
import 'package:kokozaki_app_project_1/followers_screen.dart';
import 'package:kokozaki_app_project_1/likedproducts_screen.dart';
import 'package:kokozaki_app_project_1/login_screen.dart';
import 'package:kokozaki_app_project_1/notifications_screen.dart';
import 'package:kokozaki_app_project_1/orderhistory_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                          'Settings',
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
                const SizedBox(height: 20),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/Profile Pic.jpeg'),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Ali Raza Baloch',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search settings..',
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                    child: Text('Your earnings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))),
                const SizedBox(height: 10),
                const Center(
                    child: Text('80lac Rs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xFF647BFF)))),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Transfer to bank',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Divider(),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistoryScreen()));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.assignment, color: Color(0xFF647BFF)),
                    title: Text('Order History',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 18),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LikedProductsScreen()));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.favorite, color: Color(0xFF647BFF)),
                    title: Text('Liked Products',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 18),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowersScreen()));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.person, color: Color(0xFF647BFF)),
                    title: Text('Followers',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 18),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings()));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.badge, color: Color(0xFF647BFF)),
                    title: Text('Account Settings',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 18),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.help, color: Color(0xFF647BFF)),
                  title: Text('Q&A',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.info, color: Color(0xFF647BFF)),
                  title: Text('About',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18),
                ),
                const Divider(),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.logout, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Icon(Icons.group_add, color: Colors.black, size: 25),
                  ],
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
