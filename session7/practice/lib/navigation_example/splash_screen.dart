import 'package:flutter/material.dart';
import 'package:practice/navigation_example/screen1.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      // Navigator.pushNamed(context, '/screen1');
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/screen1',
        (r) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
