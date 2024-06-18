import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gex_intro/app/controllers/user_controller.dart';
import 'package:gex_intro/app/screens/data_screen.dart';
import 'package:gex_intro/app/screens/register_user_screen.dart';

void main() {
  // Get.put<UserController>(UserController());  // Injentando na memória do dispositivo um objeto do tipo UserController - Injeção de dependência

  //Injeta na memória somente quando for chamado com Get.find()
  Get.lazyPut<UserController>(() => UserController());  // Injentando na memória do dispositivo um objeto somente quando for chamado

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/dataScreen':(_) => const DataScreen(),
      },
      home: RegisterUserScreen(),
    );
  }
}
