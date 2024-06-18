import 'package:get/get.dart';
import 'package:task_list_getx/app/models/task.dart';

class TaskListController extends GetxController  {
  final RxBool _showOnlyNotConcluded = false.obs;
  bool get showOnlyNotConcluded => _showOnlyNotConcluded.value;
  void updateFilter(bool showOnlyNotConcluded) => _showOnlyNotConcluded.value = showOnlyNotConcluded;

  final RxList<Task> _tasksList = <Task>[].obs;
  List<Task> get tasksList => showOnlyNotConcluded ? _tasksList.where((task) => !task.isConcluded).toList() : _tasksList.toList().obs;

  void addTask(String description) {
    _tasksList.add(Task(description, false));
  }

  void updateTask(String id, String newDescription, bool isConcludedChange) {
    final Task task = tasksList.firstWhere((task) => task.id == id);
    task.updateTask(newDescription, isConcludedChange);
    _tasksList.refresh();
  }

  void deleteTask(String id) {
    _tasksList.removeWhere((task) => task.id == id);
  }
}
