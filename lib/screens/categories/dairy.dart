import 'package:flutter/material.dart';

class DairyScreen extends StatelessWidget {
  const DairyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dairy')),
      body: const Center(child: Text('Dairy Category')),
    );
  }
}
