import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/task_model.dart';

class TasksRepository {
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveData(List<TaskModel> tasksList) async {
    String listJson = jsonEncode(tasksList);

    final file = await _getFile();
    return await file.writeAsString(listJson);
  }

  Future<List<TaskModel>?> readData() async {
    try {
      final file = await _getFile();

      final String listJson = await file.readAsString();
      final List<dynamic> listDecoded = jsonDecode(listJson);
      final List<TaskModel> listTasks =
          listDecoded.map((e) => TaskModel.fromJson(e)).toList();
      return listTasks;
    } catch (e) {
      return null;
    }
  }
}
