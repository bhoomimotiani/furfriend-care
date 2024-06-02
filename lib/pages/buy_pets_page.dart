import 'package:flutter/material.dart';
import 'package:pets/pages/rabbits_breed_page.dart';

import 'birds_breed_page.dart';
import 'cats_breeds_page.dart';
import 'dog_breeds.dart';
import 'fishes_breed_page.dart';

class Pet {
  final String name;
  final String imageUrl;

  Pet({required this.name, required this.imageUrl});
}


class BuyPetsPage extends StatelessWidget {
  final List<Pet> pets = [
    Pet(name: 'Dog', imageUrl: 'assets/images/dog.jpg'),
    Pet(name: 'Cat', imageUrl: 'assets/images/cat.jpg'),
    Pet(name: 'Birds', imageUrl: 'assets/images/bird.jpg'),
    Pet(name: 'Fishes', imageUrl: 'assets/images/fish.jpg'),
    Pet(name: 'Rabbits', imageUrl: 'assets/images/rabbit.jpg'),
    // Add more pets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Pets'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/dogbg.png', // Path to your background image
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // GridView of Pets
          GridView.count(
            crossAxisCount: 2,
            children: pets.map((pet) => buildPetItem(context, pet)).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildPetItem(BuildContext context, Pet pet) {
    return GestureDetector(
      onTap: () {
        if (pet.name == 'Dog') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DogBreedsPage(),
            ),
          );
        } else if (pet.name == 'Cat') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatBreedsPage(),
            ),
          );
        } else if (pet.name == 'Birds') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BirdBreedsPage(),
            ),
          );
        } else if (pet.name == 'Fishes') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FishBreedsPage(),
            ),
          );
        } else if (pet.name == 'Rabbits') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RabbitBreedsPage(),
            ),
          );
        } else {
          // Handle other pet selections
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceholderPage(petName: pet.name),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: 150,
              height: 140,
              child: Image.asset(
                pet.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              pet.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String petName;

  const PlaceholderPage({required this.petName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$petName Page'),
      ),
      body: Center(
        child: Text('Details for $petName will be available soon!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BuyPetsPage(),
  ));
}
