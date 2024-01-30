import 'package:contador_pessoas/app/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gerenciador de lotação',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
