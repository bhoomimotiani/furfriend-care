import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'choose_service_page.dart';
import 'choose_service_page.dart'; // Import the SelectionPage file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome to FurFriend Care'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          // Background Image with Opacity
          Opacity(
            opacity: 0.5, // Adjust opacity value (0.0 to 1.0)
            child: Image.asset(
              'assets/images/bg.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Welcome Message, Logo, and Moving Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Logo
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/logo1.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              // Welcome Message
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Welcome to Pet Care App!\nYour trusted companion for pet health and wellness.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Moving Text Description
              Container(
                height: 50,
                child: Marquee(
                  text: 'Discover veterinary services, buy pets, and pet grooming at your fingertips!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  scrollAxis: Axis.horizontal,
                  blankSpace: 20.0,
                  velocity: 100.0,
                  pauseAfterRound: Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
              SizedBox(height: 40),
              // Call-to-Action Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectionPage(),
                    ),
                  );
                },
                child: Text(
                  'Get Started',

                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
