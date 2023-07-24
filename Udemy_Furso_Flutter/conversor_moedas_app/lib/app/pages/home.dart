import 'package:flutter/material.dart';

import '../data/repositories/price_repository.dart';
import '../widgets/currency_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final priceRepository = PriceRepository();

  final TextEditingController _realController = TextEditingController();
  final TextEditingController _dolarController = TextEditingController();
  final TextEditingController _euroController = TextEditingController();

// Preenchidos quando os dados forem carregados no FutureBuilder:
  late double dolar;
  late double euro;

  void _realChanged(String text) {
    if (text.isEmpty) {
      _refreshTextFields();
      return;
    }

    String treatedText = text.replaceFirst(RegExp(r','), '.');

    double real = double.parse(treatedText);
    _dolarController.text = (real / dolar).toStringAsFixed(2);
    _euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _refreshTextFields();
      return;
    }

    String treatedText = text.replaceFirst(RegExp(r','), '.');

    double dolar = double.parse(treatedText);
    _realController.text = (dolar * this.dolar).toStringAsFixed(2);
    _euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _refreshTextFields();
      return;
    }

    String treatedText = text.replaceFirst(RegExp(r','), '.');

    double euro = double.parse(treatedText);
    _realController.text = (euro * this.euro).toStringAsFixed(2);
    _dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void _refreshTextFields() {
    _realController.clear();
    _dolarController.clear();
    _euroController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text("\$ Conversor \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: _refreshTextFields, icon: const Icon(Icons.refresh))
        ],
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
                dolar = snapshot.data?["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data?["results"]["currencies"]["USD"]["buy"];
                return SingleChildScrollView(
                  child: Column(
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
                              CurrencyTextForm(
                                labelText: "Reais",
                                prefixCurrency: "R\$ ",
                                controller: _realController,
                                valueChanged: _realChanged,
                              ),
                              const Divider(),
                              CurrencyTextForm(
                                labelText: "Dólares",
                                prefixCurrency: "U\$ ",
                                controller: _dolarController,
                                valueChanged: _dolarChanged,
                              ),
                              const Divider(),
                              CurrencyTextForm(
                                labelText: "Euros",
                                prefixCurrency: "€ ",
                                controller: _euroController,
                                valueChanged: _euroChanged,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
