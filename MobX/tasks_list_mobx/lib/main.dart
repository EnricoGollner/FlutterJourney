import 'package:flutter/material.dart';
import 'package:tasks_list_mobx/app/screens/main_screen.dart';

void main() {
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
