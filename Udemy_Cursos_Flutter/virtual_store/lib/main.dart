import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtual_store/firebase_options.dart';
import 'package:virtual_store/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter's Clothing",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromARGB(255, 4, 125, 141)
      ),
      home: HomeScreen(),
    );
  }
}
