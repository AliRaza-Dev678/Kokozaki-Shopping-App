import 'package:flutter/material.dart';

class FollowerButton extends StatefulWidget {
  const FollowerButton({super.key});

  @override
  State<FollowerButton> createState() => _FollowerButtonState();
}

class _FollowerButtonState extends State<FollowerButton> {
  // 1. Create a variable to track if the button is clicked
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('images/Profile Pic.jpeg'),
      ),
      title: const Text('Ali Raza Baloch'),
      trailing: GestureDetector(
        // 2. Change the state when tapped
        onTap: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Container(
          height: 35,
          // 3. Removed fixed width and added padding to adjust width to text
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            // 4. Change color based on click state
            color: isClicked ? Colors.orange : const Color(0xFF647BFF),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // 5. Change text based on click state
                isClicked ? 'Accept follow request' : 'Remove follower',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
