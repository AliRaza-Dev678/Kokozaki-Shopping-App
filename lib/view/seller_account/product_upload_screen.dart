import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../View_Models/seller_account_view_model.dart';

class ProductUploadScreen extends StatefulWidget {
  const ProductUploadScreen({super.key});

  @override
  State<ProductUploadScreen> createState() => _ProductUploadScreenState();
}

class _ProductUploadScreenState extends State<ProductUploadScreen> {
  bool isOrganic = false;
  bool addDiscount = false;
  final SellerAccountViewModel sellerAccountViewModel = Get.find<SellerAccountViewModel>();

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
          'Upload Products',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Upload Area
              Obx(
                () => InkWell(
                  onTap: () {
                    // Updated: Call pickProductImage instead of pickImageFromGallery
                    sellerAccountViewModel.pickProductImage();
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F3FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF647BFF).withOpacity(0.2)),
                      // Updated: Check productImage instead of pickedImage
                      image: sellerAccountViewModel.productImage.value != null
                          ? DecorationImage(
                              image: FileImage(sellerAccountViewModel.productImage.value!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    // Updated: Check productImage instead of pickedImage
                    child: sellerAccountViewModel.productImage.value == null
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_photo_alternate_outlined, color: Color(0xFF647BFF), size: 45),
                              SizedBox(height: 12),
                              Text(
                                'Tap to add product images',
                                style: TextStyle(color: Color(0xFF647BFF), fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Max 5 images per product',
                                style: TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Product Name
              const Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 8),
              _buildInput(Icons.shopping_bag_outlined, 'e.g. Organic Tomatoes', sellerAccountViewModel.nameController),
              const SizedBox(height: 20),

              // Price and Weight Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Price (Rs.)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        const SizedBox(height: 8),
                        _buildInput(Icons.calendar_view_day_outlined, 'e.g. 200', sellerAccountViewModel.priceController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Weight (kg)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        const SizedBox(height: 8),
                        _buildInput(Icons.menu, 'e.g. 2', sellerAccountViewModel.weightController),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Available Stock
              const Text('Available Stock (kg)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 8),
              _buildInput(Icons.archive_outlined, 'e.g. 50', sellerAccountViewModel.stockController),
              const SizedBox(height: 20),

              // Product Description
              const Text('Product Description', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: sellerAccountViewModel.descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.description_outlined, color: Color(0xFF647BFF), size: 22),
                    hintText: 'Describe your product...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Product Options
              const Text('Product Options', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.eco_outlined, color: Colors.grey),
                      title: const Text('Organic / Natural', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      subtitle: const Text('Mark if this product is organic', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      trailing: Switch(
                        value: isOrganic,
                        onChanged: (v) => setState(() => isOrganic = v),
                        activeColor: const Color(0xFF647BFF),
                      ),
                    ),
                    const Divider(height: 1, indent: 20, endIndent: 20, color: Colors.grey),
                    ListTile(
                      leading: const Icon(Icons.label_important_outline, color: Colors.grey),
                      title: const Text('Add Discount', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      subtitle: const Text('Offer a special discount on this product', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      trailing: Switch(
                        value: addDiscount,
                        onChanged: (v) => setState(() => addDiscount = v),
                        activeColor: const Color(0xFF647BFF),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Upload Button
              InkWell(
                onTap: () {
                  sellerAccountViewModel.uploadProduct();
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF647BFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Upload Product',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(IconData icon, String hint, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon, color: const Color(0xFF647BFF), size: 22),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
