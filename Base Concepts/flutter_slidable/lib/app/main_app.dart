import 'package:flutter/material.dart';
import 'package:flutter_slidable_app/app/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      title: 'Flutter Slidable',
      home: const HomePage(),
    );
  }
}
