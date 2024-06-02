import 'package:flutter/material.dart';

class BirdBreedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bird Breeds'),
      ),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/images/birdbg.jpg', // Path to your background image
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
                    BreedItem(name: 'Coclatoos', price: '50', imageUrl: 'assets/images/cockatoos.jpg'),
                    BreedItem(name: 'Finch', price: '30', imageUrl: 'assets/images/finches.jpg'),
                    BreedItem(name: 'Parrot', price: '100', imageUrl: 'assets/images/lovebirds.jpg'),
                    BreedItem(name: 'Masakali', price: '50', imageUrl: 'assets/images/masakali.jpg'),
                    BreedItem(name: 'Parakeets', price: '30', imageUrl: 'assets/images/parakeets.jpg'),
                    //BreedItem(name: 'Parrot', price: '100', imageUrl: 'assets/images/lovebirds.jpg'),
                    // Add more bird breeds as needed
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
          Text('Price: \$${widget.price}', style: TextStyle(fontSize: 16)),
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
    home: BirdBreedsPage(),
  ));
}
