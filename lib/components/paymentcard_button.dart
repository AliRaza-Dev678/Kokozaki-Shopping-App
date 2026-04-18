import 'package:flutter/material.dart';

class PaymentCardButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final bool isSelected;
  final Color? iconColor;

  const PaymentCardButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    this.isSelected = false,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isWhiteBackground = backgroundColor == Colors.white;
    Color contentColor = isWhiteBackground ? Colors.black : Colors.white;
    Color subtitleColor = isWhiteBackground ? Colors.grey : Colors.white70;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: isWhiteBackground ? Border.all(color: const Color(0xFF647BFF), width: 1) : null,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor ?? contentColor,
            size: 35,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: contentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: subtitleColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? Colors.white : (isWhiteBackground ? const Color(0xFF647BFF) : Colors.white),
            size: 25,
          ),
        ],
      ),
    );
  }
}
