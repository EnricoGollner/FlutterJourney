import 'package:flutter/material.dart';
import '../component/switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: const [
          CustomSwitch(),
        ],
      ),
      body: Container(
        width: 300,
        height: 300,
        color: Colors.green,
        child: Center(
          // Widgets de alinhamento provem um novo render
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('$_counter')],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
