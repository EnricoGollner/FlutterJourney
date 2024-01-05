import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/providers.dart';

class Page2 extends ConsumerWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(ref.watch(cursoProvider));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: const Center(),
    );
  }
}
