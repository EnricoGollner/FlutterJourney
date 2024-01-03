import 'package:flutter/material.dart';
import 'package:local_persistence_with_shared_preferences_app/app/pages/random_numbers_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomNumbersPage(),
    );
  }
}
