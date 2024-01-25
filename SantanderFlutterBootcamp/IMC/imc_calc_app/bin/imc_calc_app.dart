import 'dart:io';

import 'package:imc_calc_app/imc_calc_app.dart';
import 'package:imc_calc_app/models/Pessoa.dart';

void main(List<String> arguments) {
  print('Digite seu nome:');
  final name = stdin.readLineSync();

  if (name == null || name.isEmpty) {
    print('Nome é obrigatório!');
    return;
  }

  print('Digite seu peso:');
  final weight = double.parse(stdin.readLineSync()!);

  print('Digite sua altura:');
  final height = int.parse(stdin.readLineSync()!);
  double heightMeters = height / 100;


  final Pessoa pessoa = Pessoa(
    name: name,
    weight: weight,
    height: heightMeters,
  );

  final double imc = double.parse(calculateImc(weight: pessoa.weight, height: pessoa.height).toStringAsFixed(2));

  late String classific;

  if (imc.isNaN) {
    classific = 'Não foi possível calcular o IMC';
  } else if (imc < 16) {
    classific = '';
  } else if (imc < 17) {
    classific = '';
  } else if (imc < 18.5) {
    classific = 'Magreza leve';
  } else if (imc < 25) {
    classific = 'Peso normal';
  } else if (imc < 30) {
    classific = 'Sobrepeso';
  } else if (imc < 35) {
    classific = 'Obesidade Grau I';
  } else if (imc < 40) {
    classific = 'Obesidade Grau II (severa)';
  } else {
    classific = 'Obseridade Grau III (mórbida)';
  }

  print('Olá ${pessoa.name}, seu IMC é $imc\ne sua classificação é: $classific');
}
