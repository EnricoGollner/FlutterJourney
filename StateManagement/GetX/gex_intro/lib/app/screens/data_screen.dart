import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gex_intro/app/controllers/user_controller.dart';
import 'package:gex_intro/app/core/theme/fonts.dart';

class DataScreen extends GetView<UserController> {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<UserController>(
              // Já procura na memória a injenção da dependência do UserController
              // init: ,  - Somente é necessário quando não trabalhamos com Injeção de dependência
              // Pois o widget GetX vai procurar na memória a injeção, caso não tiver sido passado um objeto no init
              builder: (controller) {
                return Text(
                  'Name: ${controller.user.value.name}',
                  style: commonStyle,
                );
              },
            ),
            GetBuilder<UserController>( // Também busca na memória a injeção de uma dependência com o tipo passado como genérico, caso seu parâmetro init não seja passado
              // init: ,
              builder: (controller) {
              return Text(
                'Age: ${controller.user.value.age}',
                style: commonStyle,
              );
            }),
            Obx(
              () => Text(
                'Age: ${controller.user.value.age}',
                style: commonStyle,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                const String valueToReturn = 'Data from DataScreen'; 
                Get.back(result: valueToReturn); // Retorna para a tela anterior o valor passado como parâmetro:
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
