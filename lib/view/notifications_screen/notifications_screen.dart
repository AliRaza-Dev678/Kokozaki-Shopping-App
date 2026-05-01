import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/components/list_tile_button.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        'Notifications',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
              Card(child: const ListTileButton()),
            ],
          ),
        ),
      ),
    );
  }
}
