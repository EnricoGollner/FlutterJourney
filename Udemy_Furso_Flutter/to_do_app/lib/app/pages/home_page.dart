import 'package:flutter/material.dart';
import 'package:to_do_app/app/widgets/to-do_list.dart';

import '../models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toDoController = TextEditingController();

  List<TaskModel> tasks = [];

  void addTask() {
    DateTime dateAdded = DateTime.now();
    final newTask =
        TaskModel(taskName: _toDoController.text, dateAdded: dateAdded);
    setState(() {
      tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              mainAxisSize: MainAxisSize.min, // deixa o mais enxuto possível
              children: [
                _addTaskRow(),
                const SizedBox(height: 10),
                ToDoList(tasks: tasks),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child:
                          Text('Você possui ${tasks.length} tarefas pendentes'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        setState(() {
                          tasks.clear();
                        });
                      },
                      child: const Text('Limpar tudo'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _addTaskRow() {
    return Row(children: [
      Expanded(
        child: TextField(
          controller: _toDoController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Adicione uma Tarefa',
            hintText: 'Ex: Estudar Flutter',
          ),
        ),
      ),
      const SizedBox(width: 8),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.all(14),
        ),
        onPressed: addTask,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      )
    ]);
  }
}
