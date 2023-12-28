import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = TextEditingController();

  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do Basic'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        final tappedText = controller.text;

                        setState(() {
                          list.add(tappedText);
                        });

                        controller.clear();
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final String actualItem = list[index];

                return Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(actualItem),
                        subtitle: const Text('Item'),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          list.remove(actualItem);
                        });
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
