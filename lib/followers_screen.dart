import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/components/follower_button.dart';
import 'package:kokozaki_app_project_1/notifications_screen.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
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
                          'Followers',
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
                const SizedBox(height: 40),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
                FollowerButton(),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
