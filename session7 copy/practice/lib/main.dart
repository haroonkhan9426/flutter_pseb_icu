import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  var email;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (val) {
                // email = val;
                // print(email);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  final textFieldContent = controller.text;
                  print(textFieldContent);
                  controller.clear();
                },
                child: Text('Print & Clear'))
          ],
        ),
      ),
    );
  }
}
