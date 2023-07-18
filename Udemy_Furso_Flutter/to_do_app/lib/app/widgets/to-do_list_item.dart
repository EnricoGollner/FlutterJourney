import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/app/models/task_model.dart';

class ToDoListItem extends StatelessWidget {
  const ToDoListItem({super.key, required this.taskItem});

  final TaskModel taskItem;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
            onPressed: (context) => print(taskItem),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
