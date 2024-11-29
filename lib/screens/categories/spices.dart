import 'package:flutter/material.dart';

class SpicesScreen extends StatelessWidget {
  const SpicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spices')),
      body: const Center(child: Text('Spices Category')),
    );
  }
}
