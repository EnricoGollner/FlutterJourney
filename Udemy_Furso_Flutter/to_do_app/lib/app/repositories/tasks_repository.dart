import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

const String key = "tasks_list";

class TaskRepository {
  late SharedPreferences sharedPreferences;

  Future<List<TaskModel>> getTasksList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(key) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    // precisamos dizer para qual tipo de lista queremos converter:
    return jsonDecoded.map((e) => TaskModel.fromJson(e)).toList();
  }

  void saveTasks(List<TaskModel> tasksList) {
    final String tasksJson = json.encode(tasksList);
    sharedPreferences.setString(key, tasksJson);
  }
}
