import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_to_do_app/app/data/models/task_model.dart';
import 'package:new_to_do_app/app/data/repositories/tasks_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskTextEditingController =
      TextEditingController();

  List<TaskModel> tasksList = [];
  final tasksRepository = TasksRepository();

  void _addTask() {
    final taskName = _taskTextEditingController.text;
    final TaskModel newTask = TaskModel(name: taskName, isDone: false);
    setState(() {
      tasksList.insert(0, newTask);
    });

    tasksRepository.saveData(tasksList);
  }

  void _deleteTask(int index) {
    TaskModel taskToDelete = tasksList[index];

    _showSnackBarToUndo(
      context: context,
      msg: "Deseja mesmo deletar essa task?",
      index: index,
      task: taskToDelete,
    );

    setState(() {
      tasksList.removeAt(index);
    });

    tasksRepository.saveData(tasksList);
  }

  void _showSnackBarToUndo({
    required BuildContext context,
    required String msg,
    required int index,
    required TaskModel task,
  }) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(msg),
          ElevatedButton(
            onPressed: () {
              setState(() {
                tasksList.insert(index, task);
              });
              tasksRepository.saveData(tasksList);
            },
            child: const Text("Desfazer"),
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();

    tasksRepository.readData().then((listOfTasks) {
      setState(() {
        tasksList = listOfTasks ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _taskTextEditingController,
                        decoration: const InputDecoration(
                          labelText: "Nova Tarefa",
                          labelStyle: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: _addTask,
                    child: const Text("ADD"),
                  )
                ],
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: tasksList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 5);
                  },
                  itemBuilder: (context, index) {
                    TaskModel currentTask = tasksList[index];
                    return Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        dismissible: DismissiblePane(onDismissed: () {
                          setState(() {
                            _deleteTask(index);
                          });
                        }),
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (_) => _deleteTask(index),
                            icon: Icons.delete,
                            label: "Deletar",
                            backgroundColor: Colors.red,
                          )
                        ],
                      ),
                      child: CheckboxListTile(
                        secondary: CircleAvatar(
                          child: Icon(
                            currentTask.isDone ? Icons.done : Icons.error,
                          ),
                        ),
                        title: Text(currentTask.name),
                        value: currentTask.isDone,
                        onChanged: (value) {
                          setState(() {
                            currentTask.isDone = value!;
                          });
                          tasksRepository.saveData(tasksList);
                        },
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Deseja excluir todas as tarefas?"),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          final alert = AlertDialog(
                            title: const Text("Tem certeza?"),
                            content: const Text(
                                "Tem certeza de que deseja excluir todas as tarefas?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancelar"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    tasksList.clear();
                                  });
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Excluir",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          );
                          showDialog(
                              context: context, builder: (context) => alert);
                        });
                      },
                      child: const Text("Deletar"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
