import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatelessWidget {
  String? keyStr;
  String? valueStr;

  Future<void> saveData(String key, String val) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(key, val);
  }

  Future<String?> getData(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final value = sharedPreferences.getString(key);
    return value;
  }

  Future<void> deleteData(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
            decoration: InputDecoration(hintText: 'Key'),
            onChanged: (val) {
              keyStr = val;
            }),
        SizedBox(
          height: 50,
        ),
        TextField(
          onChanged: (val) {
            valueStr = val;
          },
          decoration: InputDecoration(hintText: 'Value'),
        ),
        ElevatedButton(
            onPressed: () async {
              await saveData(keyStr!, valueStr!);
              print('Data Stored');
            },
            child: Text('Store')),
        ElevatedButton(
            onPressed: () async {
              final email = await getData('email');
              print('Data Retrieved ==> key: email, value: $email');
            },
            child: Text('Get Data')),
      ],
    ));
  }
}
