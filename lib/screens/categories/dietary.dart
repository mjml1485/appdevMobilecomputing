import 'package:flutter/material.dart';

class DietaryScreen extends StatelessWidget {
  const DietaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dietary')),
      body: const Center(child: Text('Dietary Category')),
    );
  }
}
