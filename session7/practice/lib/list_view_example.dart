import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  double height = 50;
  double width = 100;

  List<String> names = [
    'haroon',
    'naseer',
    'ihtesham',
    'Ahmed',
    'qamar',
    'zainab',
    'Aisha',
    'haroon',
    'naseer',
    'ihtesham',
    'Ahmed',
    'qamar',
    'zainab',
    'Aisha',
    'haroon',
    'naseer',
    'ihtesham',
    'Ahmed',
    'qamar',
    'zainab',
    'Aisha',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(height: 100, color: Colors.red),
            Container(
                height: 500,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      Divider(height: 10, thickness: 2),
                  itemCount: names.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('name'),
                    subtitle: Text(names[index]),
                    leading: Icon(Icons.edit),
                  ),
                  primary: false,
                  shrinkWrap: true,
                  // itemExtent: 20,
                  // scrollDirection: Axis.horizontal,
                  // reverse: true,
                  // children: List.generate(
                  //   names.length,
                  //   (index) => ListTile(
                  //     title: Text('name'),
                  //     subtitle: Text(names[index]),
                  //     leading: Icon(Icons.edit),
                  //   ),
                )
                // children: [
                //   Container(height: height, width: width, color: Colors.red),
                //   Container(height: height, width: width, color: Colors.green),
                //   Container(height: height, width: width, color: Colors.blue),
                //   Container(height: height, width: width, color: Colors.yellow),
                //   Container(height: height, width: width, color: Colors.red),
                //   Container(height: height, width: width, color: Colors.green),
                //   Container(height: height, width: width, color: Colors.blue),
                //   Container(height: height, width: width, color: Colors.yellow),
                //   Container(height: height, width: width, color: Colors.red),
                //   Container(height: height, width: width, color: Colors.green),
                //   Container(height: height, width: width, color: Colors.blue),
                //   Container(height: height, width: width, color: Colors.yellow),
                //   Container(height: height, width: width, color: Colors.red),
                //   Container(height: height, width: width, color: Colors.green),
                //   Container(height: height, width: width, color: Colors.blue),
                //   Container(height: height, width: width, color: Colors.yellow),
                //   Container(height: height, width: width, color: Colors.red),
                //   Container(height: height, width: width, color: Colors.green),
                //   Container(height: height, width: width, color: Colors.blue),
                //   Container(height: height, width: width, color: Colors.yellow),
                // ],
                ),
            Container(height: 100, color: Colors.blue)
          ],
        ),
      ),
    );
  }
}
