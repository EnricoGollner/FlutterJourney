import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/app/models/task_model.dart';

class ToDoListItem extends StatelessWidget {
  const ToDoListItem(
      {super.key, required this.taskItem, required this.onDelete});

  final TaskModel taskItem;
  final Function(TaskModel) onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
            onPressed: (_) {
              onDelete(taskItem);
            },
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // CrossAxisAlignment.stretch ocupa a maior largura possível sempre
          children: [
            Text(
              DateFormat('dd/MM/yyyy - HH:mm').format(taskItem.dateAdded),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              taskItem.taskName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
