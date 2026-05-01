import 'package:flutter/material.dart';
import 'package:kokozaki_app_project_1/view/seller_account/product_upload_screen.dart';

class ProductTypeScreen extends StatefulWidget {
  const ProductTypeScreen({super.key});

  @override
  State<ProductTypeScreen> createState() => _ProductTypeScreenState();
}

class _ProductTypeScreenState extends State<ProductTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product Type',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'What do you sell?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Select one category that best describes your products.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.85,
                    children: [
                      _buildCategoryCard(
                        Icons.bakery_dining,
                        Colors.orange.shade50,
                        Colors.orange,
                        'Bakery',
                        'Bakery products',
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductUploadScreen()));
                        },
                        child: _buildCategoryCard(
                          Icons.eco,
                          Colors.green.shade50,
                          Colors.green,
                          'Vegetables',
                          'Fresh & organic vegetables',
                        ),
                      ),
                      _buildCategoryCard(
                        Icons.fastfood,
                        Colors.orange.shade50,
                        Colors.orange,
                        'Fruits',
                        'Seasonal & exotic fruits',
                      ),
                      _buildCategoryCard(
                        Icons.egg,
                        Colors.yellow.shade50,
                        Colors.yellow.shade700,
                        'Dairy & Eggs',
                        'Milk, cheese, butter & eggs',
                      ),
                      _buildCategoryCard(
                        Icons.set_meal,
                        Colors.red.shade50,
                        Colors.red,
                        'Meat & Fish',
                        'Fresh meat, poultry & seafo..',
                      ),
                      _buildCategoryCard(
                        Icons.local_drink,
                        Colors.blue.shade50,
                        Colors.blue,
                        'Beverages',
                        'Juices, drinks & water',
                      ),
                      _buildCategoryCard(
                        Icons.lunch_dining,
                        Colors.pink.shade50,
                        Colors.pink,
                        'Snacks',
                        'Snacks',
                      ),
                      _buildCategoryCard(
                        Icons.category,
                        Colors.purple.shade50,
                        Colors.purple,
                        'Other',
                        'Other',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'Select a category',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, Color bgColor, Color iconColor, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
