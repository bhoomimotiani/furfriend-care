import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> selectedBreeds;

  const CartPage({required this.selectedBreeds});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/thankubg.jpg"), // Set your background image here
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Set the opacity of the background image
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          Center(
            child: selectedBreeds.isEmpty
                ? Text(
              'Your cart is empty!',
              style: TextStyle(color: Colors.white), // Ensure text is visible on the background
            )
                : ListView.builder(
              itemCount: selectedBreeds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    selectedBreeds[index],
                    style: TextStyle(color: Colors.white), // Ensure text is visible on the background
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
