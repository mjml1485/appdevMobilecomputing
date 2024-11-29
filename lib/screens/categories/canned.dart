import 'package:flutter/material.dart';

class CannedScreen extends StatelessWidget {
  const CannedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Canned')),
      body: const Center(child: Text('Canned Category')),
    );
  }
}
