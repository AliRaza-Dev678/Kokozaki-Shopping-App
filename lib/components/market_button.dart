import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/home_screen.dart';

class MarketButton extends StatefulWidget {
  const MarketButton({super.key});

  @override
  State<MarketButton> createState() => _MarketButtonState();
}

class _MarketButtonState extends State<MarketButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
      child: Container(
        height: 113,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Image(
            image: AssetImage('images/market_logo.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
