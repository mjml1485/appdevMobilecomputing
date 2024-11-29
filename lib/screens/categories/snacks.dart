import 'package:flutter/material.dart';

class SnacksScreen extends StatefulWidget {
  const SnacksScreen({super.key});

  @override
  State<SnacksScreen> createState() => _SnacksScreenState();
}

class _SnacksScreenState extends State<SnacksScreen> {
  String selectedCategory = '';
  bool isCategorySelected = false;
  int categoryOffset = 0;

  final Map<String, List<Map<String, String>>> products = {
    'Pretzels': [
      {
        'name': 'Annie\'s Organic Pretzel Bunnies',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Pretzels/Annies_Organic_Pretzel_Bunnies.jpg',
      },
      {
        'name': 'Synders Pretzel',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Pretzels/Synders_Pretzel.jpg',
      },
      {
        'name': 'Trader Joe\'s Honey Wheat Pretzels',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Pretzels/Trader_Joes_Honey_Wheat_Pretzels.jpg',
      },
    ],
    'Trail Mix': [
      {
        'name': 'Take Root Banana Cacao Trail Mix',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Trail_Mix/Take_Root_Banana_Cacao_Trail_Mix.jpg',
      },
      {
        'name': 'Nuts & Glory Trail Mix',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Trail_Mix/Nuts_&_Glory_Trail_Mix.png',
      },
      {
        'name': 'Trophy Farms Trail Mix',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Trail_Mix/Trophy_Farms_Trail_Mix.jpg',
      },
    ],
    'Granola Bars': [
      {
        'name': 'Kind Bars',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Granola_Bars/Kind_Bars.jpg',
      },
      {
        'name': 'Nature Valley Crunchy Granola Bars',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Granola_Bars/Nature_Valley_Crunchy_Granola_Bars.jpg',
      },
      {
        'name': 'Take Root Energy Bars',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Granola_Bars/Take_Root_Energy_Bars.jpg',
      },
    ],
    'Popcorn': [
      {
        'name': 'Boom Chicka Pop (Sea Salt)',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Popcorn/Boom_Chicka_Pop.jpg',
      },
      {
        'name': 'Lesser Evil Himalayan Pink Salt Popcorn',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Popcorn/Lesser_Evil_Himalayan_Pink_Salt_Popcorn.jpg',
      },
      {
        'name': 'Skinny Pop Original',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Popcorn/Skinny_Pop_Original.jpg',
      },
    ],
    'Dark Chocolate': [
      {
        'name': 'Theo Organic 85% Dark Chocolate',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Dark_Chocolate/Theo_Organic_85%_Dark_Chocolate.jpg',
      },
      {
        'name': 'Risa Chocolates',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Dark_Chocolate/Risa_Chocolates.jpg',
      },
      {
        'name': 'Malagos Dark Chocolate (72% and 85%)',
        'description': 'Blah Blah Blah Blah.',
        'longDescription': 'Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah. Blah Blah Blah Blah.',
        'image': 'assets/categories/Snacks/Dark_Chocolate/Malagos_Dark_Chocolate.jpg',
      },
    ],
  };

  final List<String> categories = [
    'Pretzels',
    'Trail Mix',
    'Granola Bars',
    'Popcorn',
    'Dark Chocolate',
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

  void showProductDetails(BuildContext context, Map<String, String> product, String productCategory) {
    final isFavorite = favoriteProducts.contains(product['name']);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            product['image'] ?? '',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Product Name and Category
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'] ?? '',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Category: $productCategory',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Favorite Icon
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.green,
                      size: 28,
                    ),
                    onPressed: () {
                      toggleFavorite(product['name'] ?? '');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Product Long Description
              Text(
                product['longDescription'] ?? 'No detailed description available.',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
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
          'Snacks',
          style: TextStyle(
            fontFamily: 'YesevaOne',
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 10, 16.0, 7),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  hintText: 'Search products...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
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

                return GestureDetector(
                  onTap: () => showProductDetails(context, product, productCategory),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
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
                        // Favorite Icon
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.green,
                          ),
                          onPressed: () => toggleFavorite(product['name'] ?? ''),
                        ),
                      ],
                    ),
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
    return products.keys.firstWhere((category) {
      return products[category]?.contains(product) ?? false;
    }, orElse: () => '');
  }
}
