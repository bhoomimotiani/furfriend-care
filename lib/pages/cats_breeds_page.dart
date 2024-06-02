import 'package:flutter/material.dart';

class CatBreedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Breeds'),
      ),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/catbg.jpg', // Path to your background image
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
                    BreedItem(name: 'Persian Cat', price: '25,000', imageUrl: 'assets/images/persian.jpg'),
                    BreedItem(name: 'Siamese Cat', price: '15,000', imageUrl: 'assets/images/siamese.jpg'),
                    BreedItem(name: 'Maine Coon', price: '35,000', imageUrl: 'assets/images/maine.jpg'),
                    BreedItem(name: 'Ragdoll', price: '20,000', imageUrl: 'assets/images/ragdoll.jpg'),
                    BreedItem(name: 'British Shorthair', price: '30,000', imageUrl: 'assets/images/british.jpg'),
                    // Add more cat breeds as needed
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
    home: CatBreedsPage(),
  ));
}
