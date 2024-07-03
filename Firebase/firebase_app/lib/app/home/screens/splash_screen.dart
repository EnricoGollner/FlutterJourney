import 'package:firebase_app/app/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async => await _loadData());
    super.initState();
  }
  
  Future<void> _loadData()  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId == null) {
      userId = const Uuid().v4();
      prefs.setString('userId', userId);
    }

    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash Screen'),),
    );
  }
}