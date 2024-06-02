import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'welcome_page.dart'; // Ensure you import the WelcomePage here

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password, BuildContext context) async {
    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/register"),
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Account created successfully');

        // Navigate to the WelcomePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      } else {
        print('Failed to create account');
        // Show an error message or handle the error accordingly
      }
      print(response.body);
    } catch (e) {
      print(e.toString());
      // Show an error message or handle the error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.brown,
      ),
    body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/loginbg.jpg"), // Set your background image here
    fit: BoxFit.cover,
    ),
    ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                login(emailController.text, passwordController.text, context);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
