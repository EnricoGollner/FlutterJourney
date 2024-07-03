import 'package:firebase_app/app/home/screens/home_screen.dart';
import 'package:firebase_app/app/tarefa/screens/task_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Tasks List'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TaskScreen())),
          ),
        ],
      ),
    );
  }
}