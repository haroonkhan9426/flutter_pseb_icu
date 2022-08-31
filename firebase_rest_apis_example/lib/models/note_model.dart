class NoteModel {
  String? content;
  DateTime? timestamp;

  toMap() {
    return {
      'content': content,
      'createAt': timestamp,
    };
  }
}
