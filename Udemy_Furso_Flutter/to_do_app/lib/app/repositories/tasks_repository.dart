import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

class TaskRepository {
  TaskRepository() {
    SharedPreferences.getInstance()
        .then((insance) => sharedPreferences = insance);
  }

  late SharedPreferences sharedPreferences;

  void saveTasks(List<TaskModel> tasksList) {
    final String tasksJson = json.encode(tasksList);
    sharedPreferences.setString('tasksList', tasksJson);
  }
}
