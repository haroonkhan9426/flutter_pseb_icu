import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_rest_apis_example/models/note_model.dart';

class DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  storeTask(NoteModel note) async {
    // firestore
    //     .collection('notes')
    //     .add(note.toMap()); // docID will be auto generated.

    firestore
        .collection('notes')
        .doc('123')
        .set(note.toMap()); // docId id will be '123'

    const userId = '5KKogziGB6CwRgXwLcW8';
    firestore
        .collection('users')
        .doc(userId)
        .collection('notes')
        .add(note.toMap());

    firestore
        .collection('users')
        .doc(userId)
        .collection('notes')
        .doc('1234')
        .set(note.toMap());
  }

  getTasks(uid) async {
    List tasks = [];

    final snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .where('content', isEqualTo: 'this notes');
    // await firestore.collection('users').doc(uid).collection('tasks').get();
    if (snapshot.docs.isNotEmpty) {
      tasks = snapshot.docs;
    }
    return tasks;
  }
}
