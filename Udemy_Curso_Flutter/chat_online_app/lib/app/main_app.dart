import 'package:chat_online_app/app/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
      )),
      title: "Chat App",
      home: const HomePage(),
    );
  }
}
