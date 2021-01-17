import 'package:PersonalToolbag/service/recent_activities_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeViewModel {
  final RecentActivitiesService _recentActivitiesService;

  HomeViewModel() : _recentActivitiesService = RecentActivitiesService();

  Stream<QuerySnapshot> getRecentActivities() {
    return _recentActivitiesService.getRecentActivities();
  }
}
