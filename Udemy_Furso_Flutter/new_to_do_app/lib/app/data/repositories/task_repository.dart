import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/task_model.dart';

class Repository {
  Future<File> _getFile() async {
    final path = await getApplicationDocumentsDirectory();

    return File("$path/data.json");
  }

  Future<File> _saveData(List<TaskModel> tasksList) async {
    final listTasksJson = jsonEncode(tasksList);
    final file = await _getFile();

    return file.writeAsString(listTasksJson);
  }

  Future<String?> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
