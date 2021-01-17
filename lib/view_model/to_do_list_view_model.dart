import 'package:PersonalToolbag/service/recent_activities_service.dart';
import 'package:PersonalToolbag/service/todo_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoListViewModel {
  final TodoService _todoService;
  final RecentActivitiesService _recentActivitiesService;

  TodoListViewModel()
      : _todoService = TodoService(),
        _recentActivitiesService = RecentActivitiesService();

  Stream<QuerySnapshot> getTodoList() {
    return _todoService.getTodoList();
  }

  Future addTodo(String text) {
    Map<String, dynamic> data = {
      "text": text,
      "isCompleted": false,
      "created_at": DateTime.now(),
    };
    _recentActivitiesService.addActivity("To-Do Task Added");
    return _todoService.addTodo(data);
  }

  Future updateTodo(DocumentReference reference, bool value) {
    Map<String, dynamic> data = {
      "isCompleted": value,
    };
    _recentActivitiesService.addActivity("To-Do Task Modified");
    return _todoService.updateTodo(reference, data);
  }
}
