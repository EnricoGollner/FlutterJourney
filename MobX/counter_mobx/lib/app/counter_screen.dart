import 'package:counter_mobx/app/counter_mobx_service_codegen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // final CounterMobXService _counterMobXService = CounterMobXService();
  final CounterMobXStoreCodeGen _counterMobXService = CounterMobXStoreCodeGen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX Counter'),
      ),
      body: Center(
        child: Observer(
          builder: (context) {
            return Text(
              _counterMobXService.counter.toString(),
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counterMobXService.incrementAction(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
