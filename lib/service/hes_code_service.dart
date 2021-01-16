import 'package:cloud_firestore/cloud_firestore.dart';

class HesCodeService {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _hesCodeCollection;

  HesCodeService() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _hesCodeCollection = _firebaseFirestore.collection("hes_codes");
  }

  Stream<QuerySnapshot> getHesCodes() {
    return _hesCodeCollection.snapshots();
  }

  Future<void> addHesCode() async {
    await _hesCodeCollection.add(
      {
        "Hello": "Samed",
        "1": 2,
      },
    );
  }
}
