import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage("assets/profile.jpg"),
                backgroundColor: Colors.grey.shade200,
              ),
              const SizedBox(height: 20),
              const Text(
                "Coco Martin",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "cocomartin@example.com",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement Edit Profile functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Edit Profile", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 30),
              // Divider
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              // Menu Options
              ListTile(
                leading: const Icon(Icons.history, color: Colors.green),
                title: const Text("Order History"),
                onTap: () {
                  // TODO: Navigate to Order History
                },
              ),
              const Divider(thickness: 1),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.green),
                title: const Text("Settings"),
                onTap: () {
                  // TODO: Navigate to Settings
                },
              ),
              const Divider(thickness: 1),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("Log Out"),
                onTap: () {
                  // TODO: Implement Log Out functionality
                  _showLogoutConfirmation(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // TODO: Perform log-out actions
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Log Out"),
            ),
          ],
        );
      },
    );
  }
}
