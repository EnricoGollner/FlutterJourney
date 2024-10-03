
import 'package:counter_mobx/store/counter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final CounterStore store = CounterStore();

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (context) => Text(store.counter.toString()),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.incrementer,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
