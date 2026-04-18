import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/notifications_screen.dart';

import 'components/singlechat_button.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
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
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('images/Profile Pic.jpeg'),
                          ),
                          const SizedBox(width: 10),
                          const Flexible(
                            child: Text(
                              'Ali Raza Baloch',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
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
                                builder: (context) => const NotificationsScreen()),
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
                const SingleChatButton(containerColor: Colors.orange),
                const SizedBox(height: 8,),
                const Align(
                    alignment: Alignment.centerRight,
                    child: SingleChatButton(containerColor: Color(0xFF647BFF))),
                const SizedBox(height: 8,),
                const SingleChatButton(containerColor: Colors.orange),
                const SizedBox(height: 8,),
                const Align(
                    alignment: Alignment.centerRight,
                    child: SingleChatButton(containerColor: Color(0xFF647BFF))),
                const SizedBox(height: 8,),
                const  SingleChatButton(containerColor: Colors.orange),
                const SizedBox(height: 8,),
                const Align(
                    alignment: Alignment.centerRight,
                    child: SingleChatButton(containerColor: Color(0xFF647BFF))),
                const SizedBox(height: 8,),
                const SingleChatButton(containerColor: Colors.orange),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Write message...',style: TextStyle(color: Colors.grey),)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF647BFF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.image_outlined, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 10),
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),

    );
  }
}
