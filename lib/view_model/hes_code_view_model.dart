import 'package:PersonalToolbag/service/hes_code_service.dart';
import 'package:PersonalToolbag/service/recent_activities_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HesCodeViewModel {
  final HesCodeService _hesCodeService;
  final RecentActivitiesService _recentActivitiesService;

  HesCodeViewModel()
      : _hesCodeService = HesCodeService(),
        _recentActivitiesService = RecentActivitiesService();

  Stream<QuerySnapshot> getHesCodes() {
    return _hesCodeService.getHesCodes();
  }

  Future addHesCode(String code) {
    Map<String, dynamic> data = {
      "code": code,
      "isDeleted": false,
    };
    _recentActivitiesService.addActivity("HES Code Generated");
    return _hesCodeService.addHesCode(data);
  }

  Future deleteHesCode(DocumentReference reference) {
    Map<String, dynamic> data = {
      "isDeleted": true,
    };
    _recentActivitiesService.addActivity("HES Code Deleted");
    return _hesCodeService.deleteHesCode(reference, data);
  }
}
