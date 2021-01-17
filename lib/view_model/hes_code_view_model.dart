import 'package:PersonalToolbag/service/hes_code_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HesCodeViewModel {
  final HesCodeService _hesCodeService;

  HesCodeViewModel() : _hesCodeService = HesCodeService();

  Stream<QuerySnapshot> getHesCodes() {
    return _hesCodeService.getHesCodes();
  }

  Future addHesCode(String code) {
    Map<String, dynamic> data = {
      "code": code,
      "isDeleted": false,
    };
    return _hesCodeService.addHesCode(data);
  }

  Future deleteHesCode(DocumentReference reference) {
    Map<String, dynamic> data = {
      "isDeleted": true,
    };
    return _hesCodeService.deleteHesCode(reference, data);
  }
}
