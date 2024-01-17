import 'dart:io';

class ContaBancaria {
  final int numeroConta;
  final String nomeTitular;
  final double saldo;

  ContaBancaria(
      {required this.numeroConta,
      required this.nomeTitular,
      required this.saldo});

  int getNumeroConta() {
    return numeroConta;
  }

  String getNomeTitular() {
    return nomeTitular;
  }

  double getSaldo() {
    return saldo;
  }
}

void main() {
  int numeroConta = int.parse(stdin.readLineSync()!);
  String nomeTitular = stdin.readLineSync()!;
  double saldo = double.parse(stdin.readLineSync()!);

  //TODO: Criar uma instância de "ContaBancaria" com os valores de Entrada.
  final ContaBancaria conta = ContaBancaria(numeroConta: numeroConta, nomeTitular: nomeTitular, saldo: saldo);

  print("Informacoes:");
  //TODO: Imprimir as informações da conta usando o objeto criado no TODO acima.
  print("Conta: ${conta.numeroConta}");
  print("Titular: ${conta.nomeTitular}");
  print("Saldo: R\$ ${conta.saldo}");
}
