import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:kokozaki_app_project_1/view/seller_account/my_products.dart';
import 'package:kokozaki_app_project_1/view/seller_account/product_type_screen.dart';

class ProductModel {
  String name;
  String price;
  String weight;
  String stock;
  String description;
  File? image;

  ProductModel({
    required this.name,
    required this.price,
    required this.weight,
    required this.stock,
    required this.description,
    this.image,
  });
}

class SellerAccountViewModel extends GetxController {
  // Separate variables for images
  var cnicImage = Rxn<File>();
  var productImage = Rxn<File>();
  
  final ImagePicker _picker = ImagePicker();

  // Text Controllers for product upload
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final weightController = TextEditingController();
  final stockController = TextEditingController();
  final descriptionController = TextEditingController();

  // Text Controllers for seller account information
  final shopNameController = TextEditingController();
  final ownerNameController = TextEditingController();
  final shopDescriptionController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailAddressController = TextEditingController();
  final shopAddressController = TextEditingController();
  final cnicNumberController = TextEditingController();

  // Observable list of products
  var myProducts = <ProductModel>[].obs;
  
  var isLoadingLocation = false.obs;

  // Edit logic variables
  var isEditing = false.obs;
  var editingIndex = (-1).obs;

  // Function to Get User Location & Fill Address Field
  Future<void> getCurrentLocation() async {
    try {
      isLoadingLocation.value = true;
      
      // 1. Request permission
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        isLoadingLocation.value = false;
        Get.snackbar('Permission Denied', 'Location permissions are required.');
        return;
      }
      
      // 2. Get the current position
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // 3. Reverse Geocoding to fill address field
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        // Formatting the address string simply
        String formattedAddress = "${place.street ?? ""}, ${place.locality ?? ""}, ${place.country ?? ""}";
        shopAddressController.text = formattedAddress;
      }
      
      isLoadingLocation.value = false;
      Get.snackbar('Success', 'Location found!');
    } catch (e) {
      isLoadingLocation.value = false;
      Get.snackbar('Error', 'Failed to get location: $e');
    }
  }

  Future<void> pickCnicImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        cnicImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  Future<void> pickProductImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        productImage.value = File(image.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void createAccount() {
    if (shopNameController.text.trim().isEmpty ||
        ownerNameController.text.trim().isEmpty ||
        shopDescriptionController.text.trim().isEmpty ||
        phoneNumberController.text.trim().isEmpty ||
        emailAddressController.text.trim().isEmpty ||
        shopAddressController.text.trim().isEmpty ||
        cnicNumberController.text.trim().isEmpty ||
        cnicImage.value == null) {
      
      Get.snackbar(
        'Incomplete Form',
        'Please fill all fields and upload your CNIC front to continue.',
      );
      return;
    }

    Get.to(() => const ProductTypeScreen());
  }

  void uploadProduct() {
    if (nameController.text.isEmpty || priceController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in Name and Price');
      return;
    }

    if (isEditing.value) {
      myProducts[editingIndex.value] = ProductModel(
        name: nameController.text,
        price: priceController.text,
        weight: weightController.text,
        stock: stockController.text,
        description: descriptionController.text,
        image: productImage.value,
      );
    } else {
      final newProduct = ProductModel(
        name: nameController.text,
        price: priceController.text,
        weight: weightController.text,
        stock: stockController.text,
        description: descriptionController.text,
        image: productImage.value,
      );
      myProducts.add(newProduct);
    }

    clearProductFields();
    Get.off(() => const MyProducts());
    Get.snackbar('Success', isEditing.value ? 'Product updated!' : 'Product uploaded!');
  }

  void deleteProduct(int index) {
    myProducts.removeAt(index);
    Get.snackbar('Deleted', 'Product removed successfully.');
  }

  void startEditing(int index) {
    isEditing.value = true;
    editingIndex.value = index;
    ProductModel product = myProducts[index];

    nameController.text = product.name;
    priceController.text = product.price;
    weightController.text = product.weight;
    stockController.text = product.stock;
    descriptionController.text = product.description;
    productImage.value = product.image;
  }

  void clearProductFields() {
    nameController.clear();
    priceController.clear();
    weightController.clear();
    stockController.clear();
    descriptionController.clear();
    productImage.value = null;
    isEditing.value = false;
    editingIndex.value = -1;
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    weightController.dispose();
    stockController.dispose();
    descriptionController.dispose();
    shopNameController.dispose();
    ownerNameController.dispose();
    shopDescriptionController.dispose();
    phoneNumberController.dispose();
    emailAddressController.dispose();
    shopAddressController.dispose();
    cnicNumberController.dispose();
    super.onClose();
  }
}
