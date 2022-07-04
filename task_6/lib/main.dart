import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const Text(
              'Haroon Khan',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextField(hintText: '+923150999098', icon: Icons.phone),
            // CustomTextField(Icons.phone, '+923150999098'),
            SizedBox(height: 10),
            CustomTextField(icon: Icons.email, hintText: 'username@domain.com')
            // CustomTextField(Icons.email, 'username@domain.com'),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final icon;
  final hintText;

  CustomTextField({required this.icon, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 7),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
