import 'package:flutter/material.dart';

class SingleChatButton extends StatefulWidget {
  final Color containerColor;
  const SingleChatButton({super.key, required this.containerColor});

  @override
  State<SingleChatButton> createState() => _SingleChatButtonState();
}

class _SingleChatButtonState extends State<SingleChatButton> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 250,
          decoration: BoxDecoration(
            color: widget.containerColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non tempor libero. Integer ut sapien vel eros tincidunt',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '01:00 pm',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
