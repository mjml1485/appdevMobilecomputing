import 'package:flutter/material.dart';
import '../auth/log_in.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  void _logOut(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Out'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _logOut(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: const Size(150, 50),
          ),
          child: const Text(
            'Log Out',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
