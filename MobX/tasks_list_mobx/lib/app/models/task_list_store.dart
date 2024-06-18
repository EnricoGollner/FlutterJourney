import 'package:mobx/mobx.dart';
import 'package:tasks_list_mobx/app/models/task_store.dart';

part 'task_list_store.g.dart';

class TaskListStore = _TaskListStore with _$TaskListStore;

abstract class _TaskListStore with Store {
  final Observable<bool> _showOnlyNotConcluded = Observable<bool>(false);
  bool get showOnlyNotConcluded => _showOnlyNotConcluded.value;

  @action
  void updateFilter(bool showOnlyNotConcluded) {
    _showOnlyNotConcluded.value = showOnlyNotConcluded;
  }

  final ObservableList<TaskStore> _tasksList = ObservableList<TaskStore>().asObservable();

  @computed  // Observa objetos alterados
  List<TaskStore> get tasksList {
    return showOnlyNotConcluded
      ? _tasksList.where((task) => !task.isConcluded).toList()
      : _tasksList;
  }


  @action
  void addTask(String description) {
    tasksList.add(TaskStore(description, false));
  }

  @action
  void updateTask(String id, String newDescription, bool isConcludedChange) {
    final TaskStore task = tasksList.firstWhere((task) => task.id == id);
    task.updateTask(newDescription, isConcludedChange);
  }

  @action
  void deleteTask(String id) {
    tasksList.removeWhere((task) => task.id == id);
  }
}
