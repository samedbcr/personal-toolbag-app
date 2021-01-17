import 'package:cloud_firestore/cloud_firestore.dart';

class RecentActivitiesService {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _recentActivitiesCollection;

  RecentActivitiesService() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _recentActivitiesCollection =
        _firebaseFirestore.collection("recent_activities");
  }

  Stream<QuerySnapshot> getRecentActivities() {
    Query _recentActivitiesQuery = _recentActivitiesCollection
        .orderBy('created_at', descending: true)
        .limit(8);
    return _recentActivitiesQuery.snapshots();
  }

  Future<DocumentReference> addActivity(String text) async {
    return await _recentActivitiesCollection.add({
      "text": text,
      "created_at": DateTime.now(),
    });
  }
}
