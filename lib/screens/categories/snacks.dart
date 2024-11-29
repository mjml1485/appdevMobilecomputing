import 'package:flutter/material.dart';

class SnacksScreen extends StatelessWidget {
  const SnacksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snacks')),
      body: const Center(child: Text('Snacks Category')),
    );
  }
}
