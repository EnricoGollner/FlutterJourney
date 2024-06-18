import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_list_mobx/app/models/task_list_store.dart';
import 'package:tasks_list_mobx/app/screens/main_screen.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<TaskListStore>(TaskListStore());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks List with MobX',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
