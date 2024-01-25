import 'package:flutter/material.dart';
import 'package:imc_calculator_history_app/core/util/formatters.dart';

class CustomCardIMC extends StatelessWidget {
  final double imc;
  final String classification;
  final double weight;
  final String date;
  final void Function() deleteFunction;

  const CustomCardIMC({super.key, required this.imc, required this.weight, required this.date, required this.deleteFunction, required this.classification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('IMC: ${Formatters.numberToDecimal(imc)} - ($classification)'),
          Text('Weight: ${Formatters.numberToDecimal(weight)}'),
        ],
      ),
      subtitle: Text(date),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: deleteFunction,
      ),
    );
  }
}