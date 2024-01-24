import 'package:flutter/material.dart';
import 'package:imc_calculator_history_app/core/util/formatters.dart';

class CustomCardIMC extends StatelessWidget {
  final double imc;
  final double weight;
  final String date;
  final void Function() deleteFunction;

  const CustomCardIMC({super.key, required this.imc, required this.weight, required this.date, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('IMC: ${Formatters.numberToDecimal(imc)} \n- Weight: ${Formatters.numberToDecimal(weight)}'),
      subtitle: Text(date),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: deleteFunction,
      ),
    );
  }
}