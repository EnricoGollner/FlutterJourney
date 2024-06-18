import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasks_list_mobx/app/models/task_list_store.dart';
import 'package:tasks_list_mobx/app/models/task_store.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final TextEditingController _descriptionTextController = TextEditingController();
  final TaskListStore _tasksListStore = TaskListStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks List MobX'),
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
                Observer(builder: (context) {
                  return Switch(
                    value: _tasksListStore.showOnlyNotConcluded,
                    onChanged: _tasksListStore.updateFilter,
                  );
                }),
              ],
            ),
            Expanded(
              child: Observer(
                builder: (context) => ListView.builder(
                  itemCount: _tasksListStore.tasksList.length,
                  itemBuilder: (context, index) {
                    final TaskStore task = _tasksListStore.tasksList[index];

                    return Observer(
                      builder: (context) {
                        return Dismissible(
                          key: ValueKey(task.id),
                          onDismissed: (direction) => _tasksListStore.deleteTask(task.id),
                          child: CheckboxListTile(
                            onChanged: (isConcluded) {
                              task.isConcluded = isConcluded!;
                              _tasksListStore.updateTask(task.id, task.description, task.isConcluded);
                            },
                            value: task.isConcluded,
                            title: Text(task.description),
                          ),
                        );
                      }
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
    _tasksListStore.addTask(_descriptionTextController.text);
    _descriptionTextController.clear();
    Navigator.pop(context);
  }
}
