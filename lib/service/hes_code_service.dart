import 'package:cloud_firestore/cloud_firestore.dart';

class HesCodeService {
  FirebaseFirestore _firebaseFirestore;
  CollectionReference _hesCodeCollection;

  HesCodeService() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _hesCodeCollection = _firebaseFirestore.collection("hes_codes");
  }

  Stream<QuerySnapshot> getHesCodes() {
    Query _hesCodesQuery =
        _hesCodeCollection.where('isDeleted', isEqualTo: false);
    return _hesCodesQuery.snapshots();
  }

  Future<DocumentReference> addHesCode(Map<String, dynamic> data) async {
    return await _hesCodeCollection.add(data);
  }

  Future<void> deleteHesCode(
      DocumentReference reference, Map<String, dynamic> data) async {
    return await reference.update(data);
  }
}
