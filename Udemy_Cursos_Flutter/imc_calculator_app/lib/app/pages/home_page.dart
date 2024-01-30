import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  String _resultText = "Informe seus dados!";

  void _resetFields() {
    _weightController.clear();
    _heightController.clear();
    setState(() => _resultText = "Informe seus dados!");
  }

  void _calculate() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) /
        100; // convertendo altura por ser em cm

    double imc = weight / (height * height);

    setState(() {
      _resultText = "IMC: ${imc.toStringAsPrecision(3)} - ";
      if (imc < 18.5) {
        _resultText += "Abaixo do peso.";
      } else if (imc >= 18.5 && imc < 24.9) {
        _resultText = "Peso normal.";
      } else if (imc >= 25 && imc < 29.9) {
        _resultText += "Sobrepeso.";
      } else if (imc >= 30 && imc < 34.9) {
        _resultText += "Obesidade grau 1.";
      } else if (imc >= 35 && imc < 39.9) {
        _resultText += "Obesidade grau 2.";
      } else {
        _resultText += "Obesidade grau 3 (obesidade mórbida).";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        actions: [
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outline,
              size: 100,
              color: Colors.green,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldToCalc(
                    textController: _weightController,
                    labelText: 'Peso (Kg)',
                  ),
                  TextFieldToCalc(
                    textController: _heightController,
                    labelText: 'Altura (Cm)',
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calculate();
                  }
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Text(
              _resultText,
              style: const TextStyle(fontSize: 20, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldToCalc extends StatelessWidget {
  const TextFieldToCalc({
    super.key,
    required TextEditingController textController,
    required String labelText,
  })  : _textController = textController,
        _labelText = labelText;

  final TextEditingController _textController;
  final String _labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      controller: _textController,
      decoration: InputDecoration(
        labelText: _labelText,
        labelStyle: const TextStyle(fontSize: 20),
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.green, fontSize: 25.0),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Insira seu $_labelText!";
        }
      },
    );
  }
}
