import 'package:flutter/material.dart';

class DogBreedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breeds'),
        backgroundColor: Colors.purple ,
      ),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/dog2bg.jpg', // Path to your background image
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Foreground content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    BreedItem(name: 'Great Dane', price: '18,000', imageUrl: 'assets/images/great.jpeg'),
                    BreedItem(name: 'Shitzu', price: '10,000', imageUrl: 'assets/images/shitzu.jpeg'),
                    BreedItem(name: 'German Shepherd', price: '60,000', imageUrl: 'assets/images/saintbernard.jpg'),
                    BreedItem(name: 'French Pitbul', price: '20,000', imageUrl: 'assets/images/pitbul.jpg'),
                    BreedItem(name: 'Pug', price: '22,000', imageUrl: 'assets/images/pug.jpg'),
                    BreedItem(name: 'pomerian', price: '8,000', imageUrl: 'assets/images/pom.jpg'),
                    BreedItem(name: 'Labrador', price: '8,000', imageUrl: 'assets/images/labra.jpg'),
                    BreedItem(name: 'Siberian Husky', price: '50,000', imageUrl: 'assets/images/husky.jpg'),
                    BreedItem(name: 'Golden Retriever', price: '20,000', imageUrl: 'assets/images/golden.jpg'),
                    BreedItem(name: 'Chao Chao', price: '16,000', imageUrl: 'assets/images/chao.jpg'),
                    // Add more breeds as needed
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
                child: Text('Proceed'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BreedItem extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;

  const BreedItem({required this.name, required this.price, required this.imageUrl});

  @override
  _BreedItemState createState() => _BreedItemState();
}

class _BreedItemState extends State<BreedItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Stack(
              children: [
                Image.asset(widget.imageUrl, width: 200, height: 170, fit: BoxFit.cover),
                if (isSelected)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Price: ${widget.price}', style: TextStyle(fontSize: 16)),
        ],
      ),
      onTap: () {
        // Handle breed item click
      },
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Your cart is empty!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DogBreedsPage(),
  ));
}
