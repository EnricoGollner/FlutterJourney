import 'package:cubit_app/app/cubits/todo_cubit.dart';
import 'package:cubit_app/app/cubits/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TodoCubit _todoCubit;

  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _todoCubit = BlocProvider.of<TodoCubit>(context);
    
    _todoCubit.stream.listen((state) {
      if (state is TodoFailureState) {
        showAlertDialog(state.errorMessage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit App'),
      ),
      body: Stack(
        children: [
          BlocBuilder<TodoCubit, TodoState>(
            bloc: _todoCubit,
            builder: (context, state) {
              if (state is TodoInitialState) {
                return const Center(
                  child: Text('No tasks added yet!'),
                );
              } else if (state is TodoLoadingState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TodoLoadedState) {
                return _buildTodoList(state.todos);
              } else {
                return _buildTodoList(_todoCubit.todos);
              }
            },
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 4,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: 'Write your task here...',
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          _todoCubit.add(newTodo: _textController.text);
                          _textController.clear();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),),
        ],
      ),
    );
  }

  Widget _buildTodoList(List<String> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(todos[index][0].substring(0, 1)),
          ),
          title: Text(todos[index]),
          trailing: IconButton(
            onPressed: () {
              _todoCubit.remove(index: index);
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        );
      },
    );
  }

  void showAlertDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
