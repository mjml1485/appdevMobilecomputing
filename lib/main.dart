import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/auth/log_in.dart';
import 'screens/main_screens/home.dart';
import 'screens/main_screens/favorites.dart';
import 'screens/main_screens/profile.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriWise',
      theme: ThemeData(primarySwatch: Colors.green),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return const LoginScreen();
            } else {
              return const MainNavigation();
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    const FavoritesScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCustomIcon({
    required bool isSelected,
    required IconData icon,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: isSelected ? 46 : 40,
      width: isSelected ? 46 : 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.transparent,
          width: 2,
        ),
        boxShadow: isSelected
            ? [
          BoxShadow(
            color: Colors.green.withOpacity(0.4),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ]
            : [],
      ),
      child: Center(
        child: FaIcon(
          icon,
          color: isSelected ? Colors.green : Colors.white,
          size: isSelected ? 22 : 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.green.shade500,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.green.shade700,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _onItemTapped(0),
              child: _buildCustomIcon(
                isSelected: _selectedIndex == 0,
                icon: Icons.favorite,
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(1),
              child: _buildCustomIcon(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.home,
              ),
            ),
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: _buildCustomIcon(
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.userAlt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
