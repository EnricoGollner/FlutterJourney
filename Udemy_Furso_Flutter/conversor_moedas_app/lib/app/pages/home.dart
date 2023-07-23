import 'package:flutter/material.dart';

import '../data/repositories/price_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final priceRepository = PriceRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("\$ Conversor \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<Map>(
        future: priceRepository.getPrices(),
        builder: (context, snapshot) {
          // snapshot é uma cópia/foto momentânea dos dados que ele obter do servidor
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState
                  .waiting: // Se ele não estiver conectado (connectionState) ou esperando conexão, retorna:
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Carregando os dados...",
                      style: TextStyle(color: Colors.amber),
                    ),
                    SizedBox(height: 20),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Erro ao carregar os dados!",
                        style: TextStyle(color: Colors.amber),
                      ),
                      SizedBox(height: 20),
                      Icon(Icons.error)
                    ],
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      size: 150,
                      color: Colors.amber,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                label: Text(
                                  "Reais",
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.amber,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              style: const TextStyle(color: Colors.amber),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                label: Text(
                                  "Dólares",
                                  style: TextStyle(color: Colors.amber),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.amber,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.amber,
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                label: Text(
                                  "Euro",
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.amber,
                                )),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              style: const TextStyle(color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
          }
        },
      ),
    );
  }
}
