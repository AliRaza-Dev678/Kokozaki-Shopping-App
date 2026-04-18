import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/cart_screen.dart';
import 'package:kokozaki_app_project_1/notifications_screen.dart';
import 'package:kokozaki_app_project_1/product_view.dart';

class LikedProductsScreen extends StatefulWidget {
  const LikedProductsScreen({super.key});

  @override
  State<LikedProductsScreen> createState() => _LikedProductsScreenState();
}

class _LikedProductsScreenState extends State<LikedProductsScreen> {
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
                          'Liked Products',
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
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color(0xFF647BFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.qr_code, color: Colors.white, size: 22),
                          SizedBox(width: 4),
                          Text(
                            'All',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: buildCategoryButton()),
                    const SizedBox(width: 8),
                    Expanded(child: buildCategoryButton()),
                    const SizedBox(width: 8),
                    Expanded(child: buildCategoryButton()),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductView(),
                            ),
                          );
                        },
                        child: buildCategoryImageBlue(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductView(),
                            ),
                          );
                        },
                        child: buildCategoryImageBlue(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductView(),
                            ),
                          );
                        },
                        child: buildCategoryImageBlue(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductView(),
                            ),
                          );
                        },
                        child: buildCategoryImageBlue(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductView(),
                            ),
                          );
                        },
                        child: buildCategoryImageBlue(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductView(),
                            ),
                          );
                        },
                        child: buildCategoryImageBlue(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // function for category button
  Widget buildCategoryButton() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.grain, color: Colors.black, size: 20),
          SizedBox(width: 4),
          Flexible(
            child: Text(
              'Fruits',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // function for category image with blue heart
  Widget buildCategoryImageBlue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('images/vegetables_main.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(Icons.favorite, color: Colors.blue, size: 25),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 18),
            Icon(Icons.star, color: Colors.amber, size: 18),
            Icon(Icons.star, color: Colors.amber, size: 18),
            Icon(Icons.star, color: Colors.amber, size: 18),
            Icon(Icons.star, color: Colors.grey, size: 18),
            SizedBox(width: 5),
            Text("(54)", style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        const Text(
          "Vegetables",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 5),
        const Text(
          '150 RS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF647BFF),
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          child: Container(
            height: 35,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text(
                'Add to cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // function for category image with grey heart
  Widget buildCategoryImageGrey() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('images/vegetables_main.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(Icons.favorite, color: Colors.grey, size: 25),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 18),
            Icon(Icons.star, color: Colors.amber, size: 18),
            Icon(Icons.star, color: Colors.amber, size: 18),
            Icon(Icons.star, color: Colors.amber, size: 18),
            Icon(Icons.star, color: Colors.grey, size: 18),
            SizedBox(width: 5),
            Text("(54)", style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        const Text(
          "Vegetables",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 5),
        const Text(
          '150 RS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF647BFF),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 35,
          width: 90,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'Add to cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
