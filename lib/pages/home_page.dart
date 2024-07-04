import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Sign out user method
  void signUserOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      // Handle sign out errors
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the current user
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set AppBar color to blue
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          user != null
              ? "LOGGED IN AS : ${user.email}"
              : "No user logged in", // Properly handle null user
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
