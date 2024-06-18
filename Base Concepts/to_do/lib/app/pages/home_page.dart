import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listOfToDos = <String>[];
  final controller = TextEditingController();

  void addItem(String item) {
    setState(() => listOfToDos.add(item));
  }

  void deleteItem(int index) {
    setState(() => listOfToDos.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To-do'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(controller: controller),
                  ),
                  IconButton(
                    onPressed: () => addItem(controller.text),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listOfToDos.length,
                itemBuilder: (context, index) {
                  final item = listOfToDos[index];

                  return ListTile(
                    title: Text(item),
                    trailing: IconButton(
                        onPressed: () {
                          deleteItem(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                },
              ),
            )
          ],
        ));
  }
}
