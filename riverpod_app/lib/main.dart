import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/page1.dart';
import 'package:riverpod_app/page2.dart';
import 'package:riverpod_app/providers.dart';

void main() {
  runApp(
    const ProviderScope(
      // Criamos o container do Riverpod envolta do MaterialApp, tendo acesso a 100% da árvore de componentes. Entao de qualquer lugar,  temos acesso as instâncias do Riverpod
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MyWidget(),
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
      },
    );
  }
}

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nome = ref.watch(nomeProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.change_circle),
        onPressed: () {},
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(nome),
            ElevatedButton(
              onPressed: () {
                print(ref.watch(nomeProvider));
              },
              child: const Text("Buscar Nome"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/page1');
              },
              child: const Text("Page1"),
            )
          ],
        ),
      ),
    );
  }
}
