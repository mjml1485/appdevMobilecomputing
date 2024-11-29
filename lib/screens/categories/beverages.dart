import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BeveragesScreen extends StatefulWidget {
  const BeveragesScreen({super.key});

  @override
  _BeveragesScreenState createState() => _BeveragesScreenState();
}

class _BeveragesScreenState extends State<BeveragesScreen> {
  String selectedCategory = '';
  bool isCategorySelected = false;
  int categoryOffset = 0;

  final Map<String, List<Map<String, String>>> products = {
    'Coffee': [
      {'name': 'Basilio Cofee', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'SGD Coffee', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Bo\'s Coffee', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
    ],
    'Green Tea': [
      {'name': 'Yogi Green Tea', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Twinings Green Tea', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Lipton Matcha', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
    ],
    'Orange Juice': [
      {'name': 'Tropicana Pure', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Florida\'s Natural', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Locally Blended', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
    ],
    'Sparkling Water': [
      {'name': 'San Pellegrino', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Perrier', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Nature\'s Spring', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
    ],
    'Almond Milk': [
      {'name': 'Alpro Almond Milk', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Pacific Foods', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
      {'name': 'Almond Breeze', 'description': 'Blah Blah Blah Blah.', 'image': 'assets/categories/dietary.png'},
    ],
  };

  final List<String> categories = [
    'Coffee',
    'Green Tea',
    'Orange Juice',
    'Sparkling Water',
    'Almond Milk',
  ];

  Set<String> favoriteProducts = {};

  void toggleFavorite(String productName) {
    setState(() {
      if (favoriteProducts.contains(productName)) {
        favoriteProducts.remove(productName);
      } else {
        favoriteProducts.add(productName);
      }
    });
  }

  List<String> get visibleCategories {
    final end = categoryOffset + 3;
    return categories.sublist(categoryOffset, end <= categories.length ? end : categories.length);
  }

  void showNextCategories() {
    setState(() {
      if (categoryOffset + 3 < categories.length) {
        categoryOffset += 3;
      } else {
        categoryOffset = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> productsToDisplay = [];

    if (selectedCategory.isEmpty) {
      products.forEach((category, productList) {
        productsToDisplay.addAll(productList);
      });
    } else {
      productsToDisplay = products[selectedCategory] ?? [];
    }

    productsToDisplay.sort((a, b) => (a['name'] ?? '').compareTo(b['name'] ?? ''));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Beverages',
          style: TextStyle(
            fontFamily: 'YesevaOne',
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  hintText: 'Search products...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        visibleCategories.length,
                            (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedCategory == visibleCategories[index]) {
                                  selectedCategory = '';
                                  isCategorySelected = false;
                                } else {
                                  selectedCategory = visibleCategories[index];
                                  isCategorySelected = true;
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: selectedCategory == visibleCategories[index]
                                    ? Colors.green
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Text(
                                visibleCategories[index],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: selectedCategory == visibleCategories[index]
                                      ? Colors.white
                                      : Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.green),
                    onPressed: showNextCategories,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            // Product List
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productsToDisplay.length,
              itemBuilder: (context, index) {
                final product = productsToDisplay[index];
                final isFavorite = favoriteProducts.contains(product['name']);
                final productCategory = selectedCategory.isEmpty
                    ? getCategoryName(product)
                    : selectedCategory;

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          product['image'] ?? '',
                          fit: BoxFit.cover,
                          height: 120,
                          width: 120,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Title
                            Text(
                              product['name'] ?? '',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Category
                            if (selectedCategory.isEmpty)
                              Text(
                                'Category: $productCategory',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            const SizedBox(height: 5),
                            // Description
                            Text(
                              product['description'] ?? '',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Heart Icon
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () => toggleFavorite(product['name'] ?? ''),
                            icon: Icon(
                              isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String getCategoryName(Map<String, String> product) {
    for (var category in products.entries) {
      if (category.value.contains(product)) {
        return category.key;
      }
    }
    return '';
  }
}
