import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app/app/chat/screens/chat_screen.dart';
import 'package:firebase_app/app/home/screens/home_screen.dart';
import 'package:firebase_app/app/task/screens/task_screen.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              analytics.logEvent(name: 'HomePage');
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Tasks List'),
            onTap: () {
              analytics.logEvent(name: 'TasksPage');
              Navigator.push(context, MaterialPageRoute(builder: (_) => const TaskScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chat'),
            onTap: () {
              analytics.logEvent(name: 'ChatPage');
              showDialog(
                context: context,
                builder: (context) {
                  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
                  final TextEditingController nicknameCtrl = TextEditingController();

                  return AlertDialog(
                    content: Wrap(
                      children: [
                        Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(remoteConfig.getString('NICKNAME_LABEL')),
                          const SizedBox(height: 10),
                          TextField(
                            autofocus: true,
                            controller: nicknameCtrl,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) =>  ChatScreen(nickName: nicknameCtrl.text)),
                            ),
                            child: const Text(
                              'Entrar',
                            ),
                          )
                        ],
                      ),
                      ] 
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text('Crashlytics'),
            onTap: () {
              analytics.logEvent(name: 'Exception');
              throw Exception();
            },
          ),
        ],
      ),
    );
  }
}