import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/app/shared/widgets/shared_widgets_ui.dart';
import 'package:firebase_app/app/task/models/task.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _descriptionTextController = TextEditingController();

  late FirebaseFirestore _db;
  String userId = ''; 

  bool _showOnlyNotConcluded = false;
  void updateFilter(bool showOnlyNotConcluded) => setState(() => _showOnlyNotConcluded = showOnlyNotConcluded);

  @override
  void initState() {
    _db = FirebaseFirestore.instance;
    WidgetsBinding.instance.addPostFrameCallback((_) async => await _loadUser());
    super.initState();
  }

  Future<void> _loadUser()  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => userId = prefs.getString('userId')!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Tasks List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Apenas não concluídos',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: _showOnlyNotConcluded,
                  onChanged: updateFilter,
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _showOnlyNotConcluded
                  ? _db.collection('tasks').where('isConcluded', isEqualTo: false).where('userId', isEqualTo: userId).snapshots() 
                  : _db.collection('tasks').where('userId', isEqualTo: userId).snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                        children: snapshot.data!.docs.map((taskMap) {
                          final Task task = Task.fromJson(taskMap.data() as Map<String, dynamic>);

                          return Dismissible(
                            key: ValueKey(taskMap.id),
                            onDismissed: (direction) async => await _db.collection('tasks').doc(taskMap.id).delete(),
                            child: CheckboxListTile(
                              onChanged: (isConcluded) async {
                                task.isConcluded = isConcluded ?? false; 
                                task.updatedAt = DateTime.now();
                                await _db.collection('tasks').doc(taskMap.id).update(task.toJson());
                              },
                              value: task.isConcluded,
                              title: Text(task.description),
                            ),
                          );
                        },
                        ).toList(),
                  );
                }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(controller: _descriptionTextController, autofocus: true),
          actions: [
            TextButton(
              onPressed: () {
                _descriptionTextController.clear();
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async => await _addNewTask(context),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addNewTask(BuildContext context) async {
    final Task task = Task(description: _descriptionTextController.text, isConcluded: false, userId: userId);
    await _db.collection('tasks').add(task.toJson());
    _descriptionTextController.clear();
    if (context.mounted) Navigator.pop(context);
  }
}
