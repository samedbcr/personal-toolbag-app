import 'package:PersonalToolbag/service/hes_code_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HesCodeViewModel {
  final HesCodeService _hesCodeService;

  HesCodeViewModel() : _hesCodeService = HesCodeService();

  Stream<QuerySnapshot> getHesCodes() {
    return _hesCodeService.getHesCodes();
  }
}
