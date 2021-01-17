import 'package:cloud_firestore/cloud_firestore.dart';

class TodoService {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _todoCollection;

  TodoService() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _todoCollection = _firebaseFirestore.collection("todo_list");
  }

  Stream<QuerySnapshot> getTodoList() {
    Query _todoQuery = _todoCollection.orderBy("created_at", descending: true);
    return _todoQuery.snapshots();
  }

  Future<DocumentReference> addTodo(Map<String, dynamic> data) async {
    return await _todoCollection.add(data);
  }

  Future<void> updateTodo(
      DocumentReference reference, Map<String, dynamic> data) async {
    return await reference.update(data);
  }
}
