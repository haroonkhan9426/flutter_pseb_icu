import 'package:firebase_rest_apis_example/core/database_service.dart';

void main(List<String> args) async {
  final dbService = DatabaseService();
  final uid = '5KKogziGB6CwRgXwLcW8';
  final tasks = await dbService.getTasks(uid);
  print(tasks);
}
