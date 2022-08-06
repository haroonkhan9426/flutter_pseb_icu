import 'package:flutter/material.dart';
import 'package:session_12_13/sqlite_example/db/database_helper.dart';
import 'package:session_12_13/sqlite_example/models/dog.dart';
import 'package:session_12_13/sqlite_example/screens/dogs_list_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class AddDogScreen extends StatefulWidget {
  const AddDogScreen({Key? key}) : super(key: key);

  @override
  State<AddDogScreen> createState() => _AddDogScreenState();
}

class _AddDogScreenState extends State<AddDogScreen> {
  late String name;
  late int age;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Dog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Dog Name'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide Dog Name';
                    }

                    name = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Dog Age'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide Dog Age';
                    }

                    age = int.parse(value);
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var dog = Dog(name: name, age: age);

                        var dbHelper = DatabaseHelper.instance;
                        int result = await dbHelper.insertDog(dog);

                        if (result > 0) {
                          // showDialog(context: context, builder: (context) => AlertDialog(ti));

                          // Fluttertoast.showToast(msg: 'Dog Saved');
                        }
                      }
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const DogsListScreen();
                      }));
                    },
                    child: const Text('View All')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
