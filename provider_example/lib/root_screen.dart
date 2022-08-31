import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter_provider.dart';
import 'package:provider_example/home.dart';
import 'package:provider_example/profile.dart';
import 'package:provider_example/test.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key? key}) : super(key: key);
  int selectedIndex = 0;
  List screens = [
    MyHomePage(title: 'home'),
    Profile(),
    Test(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: Text('Provider Example'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Row(
                  children: [Icon(Icons.home), Text('${provider.counter}')],
                ),
                label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'test'),
          ],
        ),
        body: screens[selectedIndex],
      ),
    );
  }
}
