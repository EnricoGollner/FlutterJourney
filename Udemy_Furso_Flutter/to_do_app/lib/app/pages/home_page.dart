import 'package:flutter/material.dart';
import 'package:to_do_app/app/repositories/tasks_repository.dart';
import 'package:to_do_app/app/widgets/to_do_list.dart';

import '../models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toDoController = TextEditingController();
  final _taskRepository = TaskRepository();

  List<TaskModel> tasks = [];
  TaskModel? deletedTask;
  int? deletedTaskIndex;

  String? errorText;

  @override
  void initState() {
    // Lifecycle
    super.initState();

    _taskRepository.getTasksList().then((listTasks) {
      setState(() {
        tasks = listTasks;
      });
    });
  }

  void addTask() {
    String taskText = _toDoController.text;
    if (taskText.isEmpty) {
      setState(() {
        errorText = "O título não pode ser vazio!";
      });
      return;
    }

    DateTime dateAdded = DateTime.now();
    final newTask =
        TaskModel(taskName: _toDoController.text, dateAdded: dateAdded);
    setState(() {
      tasks.insert(0, newTask);
    });
    errorText = null;
    _toDoController.clear();
    _taskRepository.saveTasks(
        tasks); // Com o repository salvamos localmente com o packager shared_preferrences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              mainAxisSize: MainAxisSize.min, // deixa o mais enxuto possível
              children: [
                _addTaskRow(),
                const SizedBox(height: 10),
                ToDoList(tasks: tasks, onDelete: onDelete),
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
                      onPressed: showDeleteTasksConfirmationDialog,
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

  void onDelete(TaskModel taskItem) {
    deletedTask = taskItem;
    deletedTaskIndex = tasks.indexOf(taskItem);

    setState(() => tasks.remove(taskItem));
    _taskRepository.saveTasks(tasks);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Task ${taskItem.taskName} removed!"),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.black87,
        action: SnackBarAction(
          label: "Undo",
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              tasks.insert(deletedTaskIndex!, deletedTask!);
            });
            _taskRepository.saveTasks(tasks);
          },
        ),
      ),
    );
  }

  Row _addTaskRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _toDoController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Adicione uma Tarefa',
              hintText: 'Ex: Estudar Flutter',
              errorText: errorText,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff00D7F3),
                  width: 2,
                ),
              ),
              labelStyle: const TextStyle(
                color: Color(0xff00d7f3),
              ),
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
      ],
    );
  }

  void showDeleteTasksConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Limpar Tudo?"),
        content: const Text("Tem certeza que deseja apagar TODAS as tarefas?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xff00d7f3),
            ),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              deleteAllTasks();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Limpar Tudo"),
          )
        ],
      ),
    );
  }

  void deleteAllTasks() {
    setState(() {
      tasks.clear();
    });
    _taskRepository.saveTasks(tasks);
  }
}
