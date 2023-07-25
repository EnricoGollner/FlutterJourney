import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_to_do_app/app/data/models/task_model.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskTextEditingController =
      TextEditingController();

  final List<TaskModel> _tasksList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
      ),
      body: Container(
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
                      decoration:
                          const InputDecoration(labelText: "Nova Tarefa"),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add"),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: IconButton(
                            icon: const Icon(Icons.done),
                            onPressed: () {},
                          ),
                          title: const Text("Título"),
                          trailing: Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
