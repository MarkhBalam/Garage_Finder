import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Define a color palette
const Color primaryColor = Colors.blue;
const Color secondaryColor = Colors.white;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sign out user method
  void signUserOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to login page or show a message
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
        backgroundColor: primaryColor,
        title: Center(
          child: const Text('Garage Finder',
              style: TextStyle(color: secondaryColor)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          WelcomeBanner(),
          SizedBox(height: 16),
          SearchBar(),
          SizedBox(height: 16),
          QuickAccessButtons(),
          SizedBox(height: 16),
          RecentActivity(),
          SizedBox(height: 16),
          Notifications(),
          SizedBox(height: 16),
          SupportAndFeedback(),
          SizedBox(height: 16),
          UserAccountAndWallet(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: primaryColor,
        onTap: (int index) {
          switch (index) {
            case 1:
              // Navigate to My Account page
              break;
            case 2:
              signUserOut();
              break;
          }
        },
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user != null ? 'Welcome, ${user.email}!' : 'Welcome, User!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for garages...',
        prefixIcon: const Icon(Icons.search, color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: secondaryColor,
      ),
    );
  }
}

class QuickAccessButtons extends StatelessWidget {
  const QuickAccessButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        QuickAccessButton(icon: Icons.garage, label: 'Nearby Garages'),
        QuickAccessButton(icon: Icons.build, label: 'Breakdown Assistance'),
        QuickAccessButton(icon: Icons.lightbulb, label: 'DIY Solutions'),
      ],
    );
  }
}

class QuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickAccessButton({required this.icon, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, size: 32, color: primaryColor),
            onPressed: () {
              // Navigate to respective page
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: primaryColor)),
      ],
    );
  }
}

class RecentActivity extends StatelessWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // List of recent activities
          ],
        ),
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // List of notifications
          ],
        ),
      ),
    );
  }
}

class SupportAndFeedback extends StatelessWidget {
  const SupportAndFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Support and Feedback',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // Support and feedback options
          ],
        ),
      ),
    );
  }
}

class UserAccountAndWallet extends StatelessWidget {
  const UserAccountAndWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account and Wallet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            // User account and wallet details
          ],
        ),
      ),
    );
  }
}
