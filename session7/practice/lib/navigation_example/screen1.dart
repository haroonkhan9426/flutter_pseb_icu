import 'package:flutter/material.dart';
import 'package:practice/navigation_example/screen2.dart';
import 'package:practice/navigation_example/screen3.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen1'),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Screen2(),
                ),
              );
            },
            child: Text('Goto Screen2'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/screen2');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Screen3(),
              //   ),
              // );
            },
            child: Text('Goto Screen3'),
          )
        ],
      )),
    );
  }
}
