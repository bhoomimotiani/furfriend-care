import 'package:flutter/material.dart';

class PetDetailsPage extends StatelessWidget {
  final String petName;

  const PetDetailsPage({required this.petName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(petName), // Set the title to the selected pet's name
      ),
      body: Center(
        child: Text('Details of $petName'), // Display details or content related to the selected pet
      ),
    );
  }
}
