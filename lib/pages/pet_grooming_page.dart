import 'package:flutter/material.dart';
import 'cart_page.dart';

class PetGroomingPage extends StatefulWidget {
  @override
  _PetGroomingPageState createState() => _PetGroomingPageState();
}

class _PetGroomingPageState extends State<PetGroomingPage> {
  String? selectedPet;
  List<String> selectedBreeds = [];

  final Map<String, List<String>> petBreeds = {
    'Dog': ['Labrador', 'German Shepherd', 'Bulldog', 'Beagle', 'Poodle', 'Pug', 'Golden Retriever'],
    'Cat': ['Persian', 'Siamese', 'Maine Coon', 'Ragdoll', 'Sphynx'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your Pet'),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(selectedBreeds: selectedBreeds),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/grombg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: selectedPet == null ? _buildPetSelection() : _buildBreedSelection(),
      ),
    );
  }

  Widget _buildPetSelection() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              _buildPetCard('Dog', 'assets/images/dog.jpg'),
              _buildPetCard('Cat', 'assets/images/cat.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPetCard(String pet, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedPet = pet;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Text(
                pet,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreedSelection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Select the breed of your $selectedPet:', style: TextStyle(fontSize: 30)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: petBreeds[selectedPet]!.length,
            itemBuilder: (context, index) {
              final breed = petBreeds[selectedPet]![index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(breed),
                  onTap: () {
                    setState(() {
                      if (!selectedBreeds.contains(breed)) {
                        selectedBreeds.add(breed);
                      }
                    });
                    _showConfirmationDialog(breed);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showConfirmationDialog(String breed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Selection'),
          content: Text('You have selected $breed.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Proceed'),
              onPressed: () {
                Navigator.of(context).pop();
                _proceedToNextStep();
              },
            ),
          ],
        );
      },
    );
  }

  void _proceedToNextStep() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(selectedBreeds: selectedBreeds),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PetGroomingPage(),
  ));
}
