import 'package:flutter/material.dart';

class FishBreedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish Breeds'),
      ),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/fishbg.jpg', // Path to your background image
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
                    BreedItem(name: 'Goldfish', price: '15', imageUrl: 'assets/images/goldfish.jpg'),
                    BreedItem(name: 'Angel Fish', price: '10', imageUrl: 'assets/images/angel.jpg'),
                    BreedItem(name: 'Pop Eye', price: '8', imageUrl: 'assets/images/pop.jpg'),
                    BreedItem(name: 'Koi fish', price: '15', imageUrl: 'assets/images/koi.jpg'),
                    BreedItem(name: 'Star Fish', price: '10', imageUrl: 'assets/images/star.jpg'),

                    // Add more fish breeds as needed
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
    home: FishBreedsPage(),
  ));
}
