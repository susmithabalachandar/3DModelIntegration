import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'package:herbalhub/frontend/config/routes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7F6D4), // Background color as per the design
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo section
                Image.asset(
                  'lib/frontend/assets/images/home_page_logo.png', // Add your logo image to assets
                  height: 200,
                ),
                SizedBox(height: 10),
                SizedBox(height: 40),

                // Username / Email input
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFD7E9B9),
                    hintText: 'Enter the username and mail ID',
                    prefixIcon: Icon(Icons.person, color: Colors.green[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Password input
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFD7E9B9),
                    hintText: 'Enter the password',
                    prefixIcon: Icon(Icons.lock, color: Colors.green[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Login button
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.frontScreen, // Corrected to use Routes.frontScreen
                    ); // Handle login logic here
                  },
                ),
                SizedBox(height: 20),

                // Divider line
                Divider(thickness: 1, color: Colors.green[300]),
                SizedBox(height: 10),

                // Sign in using Google
                GestureDetector(
                  onTap: () {
                    // Corrected to use Routes.frontScreen
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFD7E9B9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email, color: Colors.green[700]),
                        SizedBox(width: 10),
                        Text(
                          'Sign in using HerbalHub@gmail.com',
                          style: TextStyle(color: Colors.green[800]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Help text
                Text(
                  'Need help with sign in or sign up?',
                  style: TextStyle(color: Colors.green[700]),
                ),
                SizedBox(height: 40),

                // Footer text
                Text(
                  'HerbalHub ©',
                  style: TextStyle(color: Colors.green[700], fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
