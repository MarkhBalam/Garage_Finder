import 'package:flutter/material.dart';
import 'reviews.dart';  // Import the reviews_screen.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mechanic Reviews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/reviews': (context) => ReviewsScreen(),  // Define the route for ReviewsScreen
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/reviews');  // Navigate to the ReviewsScreen
          },
          child: Text('Go to Reviews'),
        ),
      ),
    );
  }
}
