import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gex_intro/app/controllers/value_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _txtController = TextEditingController();
  final ValueController _valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Valor definido

            // GetBuilder<ValueController>(  // Aguarda um "update()" para atualizar a tela
            //   init: _valueController,
            //    builder: (valueController) {
            //     return Text('Valor definido: ${valueController.definedValue.value}');
            //   },
            // ),

            // GetX<ValueController>(  // Observa as mudanças nas variáveis observáveis (Rx) e atualiza a tela automaticamente
            //   init: _valueController,
            //    builder: (valueController) {
            //     return Text('Valor definido: ${valueController.definedValue.value}');
            //   },
            // ),

            Obx(() {
              // Observa as mudanças nas variáveis observáveis (Rx) e atualiza a tela
              return Text('Valor definido: ${_valueController.definedValue}');
            }),

            // Campo
            TextField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              controller: _txtController,
            ),
            const SizedBox(height: 16),
            GetBuilder<ValueController>(
              init: _valueController,
              builder: (valueController) {
                return valueController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          await valueController.setValue(_txtController.text);
                        },
                        child: const Text('Definir valor'),
                      );
              },
            ),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.blueAccent,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  "https://cdn1.epicgames.com/offer/24b9b5e323bc40eea252a10cdd3b2f10/EGS_LeagueofLegends_RiotGames_S2_1200x1600-905a96cea329205358868f5871393042",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
