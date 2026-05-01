import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kokozaki_app_project_1/view/seller_account/product_type_screen.dart';
import '../../View_Models/seller_account_view_model.dart';

class SellerAccountScreen extends StatefulWidget {
  const SellerAccountScreen({super.key});

  @override
  State<SellerAccountScreen> createState() => _SellerAccountScreenState();
}

class _SellerAccountScreenState extends State<SellerAccountScreen> {
  final SellerAccountViewModel sellerAccountViewModel = Get.put(SellerAccountViewModel());

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
          'Seller Account',
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
              // Become a Seller Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFADC1FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF647BFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.storefront, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Become a Seller',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A69FF),
                            ),
                          ),
                          Text(
                            'Fill in the details to setup your seller profile',
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                'Shop Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildSimpleInput(Icons.store_outlined, 'Shop Name', sellerAccountViewModel.shopNameController),
              const SizedBox(height: 10),
              _buildSimpleInput(Icons.person_outline, 'Owner Name', sellerAccountViewModel.ownerNameController),
              const SizedBox(height: 10),
              _buildSimpleInput(Icons.description_outlined, 'Shop Description', sellerAccountViewModel.shopDescriptionController),
              const SizedBox(height: 30),

              const Text(
                'Contact Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildSimpleInput(Icons.phone_outlined, 'Phone Number', sellerAccountViewModel.phoneNumberController),
              const SizedBox(height: 10),
              _buildSimpleInput(Icons.email_outlined, 'Email Address', sellerAccountViewModel.emailAddressController),
              const SizedBox(height: 10),
              
              // Shop Address with clickable icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: sellerAccountViewModel.shopAddressController,
                        decoration: InputDecoration(
                          icon: InkWell(
                            onTap: () => sellerAccountViewModel.getCurrentLocation(),
                            child: const Icon(Icons.location_on_outlined, color: Color(0xFF647BFF), size: 22),
                          ),
                          hintText: 'Shop Address',
                          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                    Obx(() => sellerAccountViewModel.isLoadingLocation.value 
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) 
                      : const SizedBox.shrink()),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                'Identity Verification',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildSimpleInput(Icons.badge_outlined, 'CNIC Number', sellerAccountViewModel.cnicNumberController),
              const SizedBox(height: 15),

              // Upload CNIC Front Button
              InkWell(
                onTap: () {
                  // Updated: Call pickCnicImage instead of pickImageFromGallery
                  sellerAccountViewModel.pickCnicImage();
                },
                child: Obx(() => Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFADC1FF),
                    borderRadius: BorderRadius.circular(15),
                    // Updated: Check cnicImage instead of pickedImage
                    image: sellerAccountViewModel.cnicImage.value != null
                        ? DecorationImage(
                            image: FileImage(sellerAccountViewModel.cnicImage.value!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  // Updated: Check cnicImage instead of pickedImage
                  child: sellerAccountViewModel.cnicImage.value == null
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload, color: Color(0xFF647BFF), size: 28),
                            SizedBox(width: 10),
                            Text(
                              'Upload CNIC Front',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Icon(Icons.edit, color: Colors.white, size: 40),
                        ),
                )),
              ),
              const SizedBox(height: 50),

              // Create Account Button
              Center(
                child: InkWell(
                  onTap: () {
                    // Call validation and navigation from ViewModel
                    sellerAccountViewModel.createAccount();
                  },
                  child: Container(
                    height: 55,
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color(0xFF647BFF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF647BFF).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  Widget _buildSimpleInput(IconData icon, String hint, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FF),
        borderRadius: BorderRadius.circular(10),
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
