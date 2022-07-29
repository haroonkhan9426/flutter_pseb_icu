import 'package:flutter/material.dart';
import 'package:practice/grid_view_example.dart';
import 'package:practice/list_view_example.dart';
import 'package:practice/navigation_example/screen2.dart';
import 'package:practice/navigation_example/screen3.dart';
import 'package:practice/navigation_example/splash_screen.dart';

import 'navigation_example/screen1.dart';

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
      // home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
      },
    );
  }
}

class CardExampleScreen extends StatelessWidget {
  const CardExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: Column(children: [
        DrawerHeader(child: Text('UserName')),
        ListTile(title: Text('Page1')),
        ListTile(title: Text('Page2')),
        ListTile(title: Text('Page3')),
        ListTile(title: Text('Page4')),
      ])),
      backgroundColor: Colors.grey,
      body: Center(
        child: Card(
          shadowColor: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('This is some test text'),
          ),
        ),
      ),
    );
  }
}

class FormExampleScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onSaved: (val) {
                      email = val;
                      print('$val Saved');
                    },
                    controller: emailCtrl,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter a valid email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Username@domain.com', labelText: 'Email'),
                  ),
                  TextFormField(
                    onSaved: (val) {
                      password = val;
                      print('$val Saved');
                    },
                    controller: passCtrl,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter a valid password';
                      } else if (val.length < 8) {
                        return 'Your password must be at least 8 characters long';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '*********',
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print('Form successfully submitted');
                        emailCtrl.clear();
                        passCtrl.clear();
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Success'),
                                  content: Text(
                                      'Congratulations! Your form was submitted successfully.'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {}, child: Text('No')),
                                    ElevatedButton(
                                        onPressed: () {}, child: Text('Yes'))
                                  ],
                                ));
                      } else {
                        print('Form submission failed because of validation');
                      }
                    },
                    child: Text('Submit'),
                  )
                ],
              ),
            )));
  }
}

class StackExample extends StatelessWidget {
  var email;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: IndexedStack(
            index: 2,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Container(color: Colors.green, height: 600, width: 300),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(color: Colors.blue, height: 200, width: 150),
              ),
              Positioned(
                  left: 40,
                  top: 50,
                  child:
                      Container(color: Colors.yellow, height: 100, width: 100)),
            ],
          ),
        ),
      ),
    );
  }
}
