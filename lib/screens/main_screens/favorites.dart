import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bookmarks")),
      body: ListView(
        children: [
          buildFavoriteItem("Apple", "assets/apple.jpg"),
          buildFavoriteItem("Salad", "assets/salad.jpg"),
          buildFavoriteItem("Soup", "assets/soup.jpg"),
        ],
      ),
    );
  }

  Widget buildFavoriteItem(String title, String image) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
