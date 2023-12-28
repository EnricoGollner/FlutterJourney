import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/app/pages/home_page.dart';
import 'package:login_app/app/pages/list_users_page/list_users.dart';
import 'package:login_app/app/pages/login_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (cotext) => StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // there's data - there's user
                  return const HomePage();
                } else {
                  return const LoginPage();
                }
              },
            ),
        '/users': (context) => const ListUsers(
              title: 'Lista de Usuários',
            )
      },
    );
  }
}
