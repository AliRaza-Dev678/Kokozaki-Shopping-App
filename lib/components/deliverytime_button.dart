import 'package:flutter/material.dart';

class DeliveryTimeButton extends StatefulWidget {
  const DeliveryTimeButton({super.key});

  @override
  State<DeliveryTimeButton> createState() => _DeliveryTimeButtonState();
}

class _DeliveryTimeButtonState extends State<DeliveryTimeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            '18 june,today',
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '08:00 am - 12:00 pm',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
