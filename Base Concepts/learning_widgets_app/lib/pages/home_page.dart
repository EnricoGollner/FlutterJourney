import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelected1 = false;
  bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showAboutDialog(
              applicationName: 'App Widgets',
              applicationVersion: 'v1.0.0',
              applicationIcon: const Icon(Icons.widgets),
              applicationLegalese: 'Application Legalese text',
              children: [
                const Text('App built to learn and test Widgets'),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Built with '),
                    FlutterLogo(),
                  ],
                )
              ],
              context: context,
            );
          },
          icon: const Icon(Icons.info),
        ),
        title: const Text('App Widgets'),
        actions: const [],
      ),
      body: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              disabledColor: Colors.blue,
              backgroundColor: Colors.red.withOpacity(0.5),
              selectedColor: Colors.green,
              label: const Text('Choice 1'),
              selected: isSelected1,
              onSelected: (value) {
                setState(() {
                  isSelected1 = true;
                  isSelected2 = false;
                });
              },
            ),
            const SizedBox(width: 10),
            ChoiceChip(
              disabledColor: Colors.blue,
              backgroundColor: Colors.red.withOpacity(0.5),
              selectedColor: Colors.green,
              label: const Text('Choice 1'),
              selected: isSelected2,
              onSelected: (value) {
                setState(() {
                  isSelected1 = false;
                  isSelected2 = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
