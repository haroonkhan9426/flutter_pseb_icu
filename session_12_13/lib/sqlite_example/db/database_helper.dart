import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:session_12_13/sqlite_example/models/dog.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  ///
  /// Database settings starts here..
  ///
  final dogsTable = 'dogs';

  // database
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    // _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/dogs.db';

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE $dogsTable (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT,
                  age INTEGER )
    
    ''');
  }

  ///
  /// Database settings end here.

  // insert
  Future<int> insertDog(Dog dog) async {
    // add dog to table

    Database db = await instance.database;
    int result = await db.insert(dogsTable, dog.toMap());
    return result;
  }

  // read operation
  Future<List<Dog>> getAllDogs() async {
    List<Dog> dogs = [];

    Database db = await instance.database;

    // read data from table
    List<Map<String, dynamic>> listMap = await db.query(dogsTable);
    for (int i = 0; i < listMap.length; i++) {
      Dog dog = Dog.fromMap(listMap[i]);
    }
    // for (var dogMap in listMap) {
    //   Dog dog = Dog.fromMap(dogMap);
    //   dogs.add(dog);
    // }

    return dogs;
  }

  // delete
  Future<int> deleteDog(int id) async {
    Database db = await instance.database;
    int result = await db.delete('tbl_dog', where: 'id=?', whereArgs: [id]);
    return result;
  }

  // update
  Future<int> updateDog(Dog dog) async {
    Database db = await instance.database;
    int result = await db
        .update('tbl_dog', dog.toMap(), where: 'id=?', whereArgs: [dog.id]);
    return result;
  }
}
