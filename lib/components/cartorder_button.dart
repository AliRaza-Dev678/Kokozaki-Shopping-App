import 'package:flutter/material.dart';

class CartOrderButton extends StatefulWidget {
  const CartOrderButton({super.key});

  @override
  State<CartOrderButton> createState() => _CartOrderButtonState();
}

class _CartOrderButtonState extends State<CartOrderButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 140,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('images/vegetables_main.png'),
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Product Details and Actions
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Vegetables',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '140 Rs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF647BFF),
                    ),
                  ),
                  // Quantity Selector
                  Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('-', style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('1', style: TextStyle(color: Color(0xFF647BFF), fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('+', style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            // Delete Button
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.delete, color: Colors.red, size: 18),
                    SizedBox(width: 4),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
