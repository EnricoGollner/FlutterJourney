import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list_getx/app/controllers/task_list_controller.dart';
import 'package:task_list_getx/app/models/task.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final TextEditingController _descriptionTextController = TextEditingController();
  final TaskListController _taskListController = TaskListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks List GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Apenas não concluídos',
                  style: TextStyle(fontSize: 18),
                ),
                Obx(
                  () => Switch(
                    value: _taskListController.showOnlyNotConcluded,
                    onChanged: _taskListController.updateFilter,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _taskListController.tasksList.length,
                  itemBuilder: (context, index) {
                    final Task task = _taskListController.tasksList[index];

                    return Dismissible(
                        key: ValueKey(task.id),
                        onDismissed: (direction) => _taskListController.deleteTask(task.id),
                        child: CheckboxListTile(
                          onChanged: (isConcluded) {
                            task.isConcluded = isConcluded!;
                            _taskListController.updateTask(task.id, task.description, task.isConcluded);
                          },
                          value: task.isConcluded,
                          title: Text(task.description),
                        ),
                      );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(controller: _descriptionTextController, autofocus: true),
          actions: [
            TextButton(
              onPressed: () {
                _descriptionTextController.clear();
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => _addNewTask(context),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _addNewTask(BuildContext context) {
    _taskListController.addTask(_descriptionTextController.text);
    _descriptionTextController.clear();
    Navigator.pop(context);
  }
}
