import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: RiveAnimation.asset(
                "assets/dash.riv",
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 300,
              child: RiveAnimation.asset("assets/heart_anime.riv"),
            )
          ],
        ),
      ),
    );
  }
}
