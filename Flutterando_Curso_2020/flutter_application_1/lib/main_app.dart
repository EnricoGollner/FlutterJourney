import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/app_controller.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* AnimatedBuilder é um Listenner que está escutando a instância e quando houver alteração nela,
    ele recarregará o builder com o valor atualizado: */
    return AnimatedBuilder(
      animation: AppController
          .instance, // está escutando a instancia e quando for alterada e notificar, rebuilda, rechamando o builder.
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutterando',
          theme: ThemeData(
            primarySwatch: Colors.red,
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelStyle: TextStyle(color: Colors.white),
            ),
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
          },
        );
      },
    );
  }
}
