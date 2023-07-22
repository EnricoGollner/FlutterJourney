import 'package:conversor_moedas_app/app/pages/home.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(primarySwatch: Colors.yellow),
      title: "Conversor de Moedas",
      home: const HomePage(),
    );
  }
}
