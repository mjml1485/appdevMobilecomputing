import 'package:flutter/material.dart';

class StaplesScreen extends StatelessWidget {
  const StaplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staples')),
      body: const Center(child: Text('Staples Category')),
    );
  }
}
