import 'package:flutter/material.dart';

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beverages')),
      body: const Center(child: Text('Beverages Category')),
    );
  }
}
