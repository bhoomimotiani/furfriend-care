import 'package:flutter/material.dart';

class RabbitBreedsPage extends StatelessWidget {
  final List<Map<String, String>> rabbits = [
    {'name': 'Rabbit Moon', 'price': '\$30', 'image': 'assets/images/rab.jpg'},
    {'name': 'Pure Fur Rabbit', 'price': '\$25', 'image': 'assets/images/fur rab.jpg'},
    {'name': 'Guinea Pig', 'price': '\$25', 'image': 'assets/images/guinea pig.jpg'},
    // Add more rabbit breeds as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rabbit Breeds'),
      ),
      body: Stack(
        children: [
          // Background Image with Opacity
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/rabbg.jpg', // Path to your background image
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Centered Scrolling Images
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3, // Adjust the vertical position
            left: 0,
            right: 0,
            child: SizedBox(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rabbits.length,
                itemBuilder: (context, index) {
                  final rabbit = rabbits[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          rabbit['image']!,
                          width: 150,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          rabbit['name']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Price: ${rabbit['price']!}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RabbitBreedsPage(),
  ));
}
