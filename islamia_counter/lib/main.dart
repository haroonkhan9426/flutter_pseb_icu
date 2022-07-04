import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Hello Islamians, How are you!',
                style: TextStyle(fontSize: 20, color: Color(0xff000000)),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black),
                primary: Colors.red,
              ),
              onPressed: () {
                print('Be gentle');
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tap Me',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.youtube_searched_for_sharp),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
