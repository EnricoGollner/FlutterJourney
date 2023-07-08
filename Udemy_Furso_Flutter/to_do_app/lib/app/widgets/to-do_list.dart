import 'package:flutter/material.dart';
import 'package:to_do_app/app/models/task_model.dart';
import 'package:to_do_app/app/widgets/to-do_list_item.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final TaskModel currentTask = tasks[index];
          return ToDoListItem(taskItem: currentTask);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 4),
      ),
    );
  }
}
