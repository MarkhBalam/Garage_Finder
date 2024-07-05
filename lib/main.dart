import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:garage_finder/pages/auth_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Corrected method name
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.car_repair,
              size: 100.0, // Adjust the icon size as needed
              color: Colors.white, // Adjust the icon color
            ),
            SizedBox(height: 20.0), // Space between icon and text
            Text(
              'Garage Finder', // Your big word
              style: TextStyle(
                fontSize: 30.0, // Adjust text size as needed
                fontWeight: FontWeight.bold, // Make text bold
                color: Colors.white, // Adjust text color
              ),
            ),
          ],
        ),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue,
        nextScreen: AuthPage(),
        splashIconSize: 300.0, // Adjust size if necessary
      ),
    );
  }
}
