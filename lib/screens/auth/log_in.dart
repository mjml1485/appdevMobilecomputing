import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'forgot_password.dart';
import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  // Method to login
  void _login() async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;

      if (email.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
        throw FirebaseAuthException(code: 'invalid-email', message: 'Please enter a valid email address');
      }

      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigation()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again later.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for this email address.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email format.';
      } else {
        errorMessage = e.message ?? errorMessage;
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/logo.png',
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',  // Apply Poppins font
                  color: Colors.green.shade800,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email or Phone Number",
                  labelStyle: TextStyle(color: Colors.green.shade800, fontFamily: 'Poppins', fontWeight: FontWeight.normal),  // Poppins regular weight
                  hintText: "Enter your email or phone",
                  hintStyle: TextStyle(color: Colors.green.shade600, fontFamily: 'Poppins', fontWeight: FontWeight.normal),  // Poppins regular weight
                  prefixIcon: Icon(Icons.email, color: Colors.green.shade800),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.green.shade800, fontFamily: 'Poppins'),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.green.shade600, fontFamily: 'Poppins'),
                  prefixIcon: Icon(Icons.lock, color: Colors.green.shade800),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,  // Medium weight for button text
                    color: Colors.white,
                    fontFamily: 'Poppins',  // Ensure the button text uses Poppins
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    ),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontFamily: 'Poppins',  // Apply Poppins font
                        color: Colors.green.shade800,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,  // Medium weight for button
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'Poppins',  // Apply Poppins font
                        color: Colors.green.shade800,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,  // Medium weight for button
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
