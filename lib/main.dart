import 'package:flutter/material.dart';
import 'package:pets/pages/buy_pets_page.dart';
import 'package:pets/pages/loginpage.dart';
import 'package:pets/pages/pet_grooming_page.dart';
import 'package:pets/pages/veterinary_service_page.dart';
import 'package:pets/pages/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Care App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/welcome': (context) => WelcomePage(),
        '/buy-pets': (context) => BuyPetsPage(),
        '/veterinary-services': (context) => VeterinaryServicesPage(),
        '/pet-grooming': (context) => PetGroomingPage(),
      },
    );
  }
}
