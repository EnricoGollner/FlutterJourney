import 'package:flutter/material.dart';
import 'package:recapitulando_to_do_app_basic/pages/home_page.dart';
import 'package:recapitulando_to_do_app_basic/pages/menu_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-do Basic',
        initialRoute: '/',
        routes: {
          '/': (context) => const MenuPage(),
          '/to-do': (context) => const HomePage()
        });
  }
}
