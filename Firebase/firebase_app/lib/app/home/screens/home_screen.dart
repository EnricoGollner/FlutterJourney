import 'package:firebase_app/app/shared/widgets/shared_widgets_ui.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Color(int.parse("0xff${remoteConfig.getString('BACKGROUND_APPBAR_COLOR')}")),
          title: const Text('Home'),
        ),
        body: Center(
          child: TextButton(onPressed: () => throw Exception(), child: Text('Throw Error')),
        )
    );
  }
}
