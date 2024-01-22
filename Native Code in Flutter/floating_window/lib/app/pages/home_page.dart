import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform = MethodChannel('floating_window');

  int counter = 0;

  @override
  void initState() {
    platform.setMethodCallHandler((call) async {
      if (call.method == 'increment') {
        increment();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Window'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(fontSize: 20),
            ),

            ElevatedButton(
              onPressed: () => platform.invokeListMethod('createAndShow'),
              child: const Text('Create and Show'),
            ),
            ElevatedButton(
              onPressed: () => platform.invokeListMethod('destroy'),
              child: const Text('Destroy'),
            ),
          ],
        ),
      ),
    );
  }

  void increment() {
    setState(() => counter++);
  }
}
