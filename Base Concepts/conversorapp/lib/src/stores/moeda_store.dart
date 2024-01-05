import 'package:conversorapp/src/models/moeda_model.dart';
import 'package:conversorapp/src/repositories/moeda_repository.dart';
import 'package:conversorapp/src/states/moeda_state.dart';
import 'package:flutter/material.dart';

///Store == Controller (Gerencia o estado)
class MoedaStore extends ValueNotifier<MoedaState> {
  MoedaStore() : super(MoedaState.init());

  final repository = MoedaRepository();

  Future<void> getMoedas() async {
    final moedas = await repository.getMoedas();

    value = value.copyWith(moedas: moedas);
  }

  Future<void> converter(String valorRaw) async {
    final cotacao = await repository.cotacao(value.moedaIn, value.moedaOut);

    final valor = double.parse(valorRaw);
    final resultado = valor * cotacao;

    value = value.copyWith(result: resultado.toStringAsFixed(2));
  }


  Future<void> selecionarMoedaIn(MoedaModel moeda) async {
    value = value.copyWith(moedaIn: moeda);
  }

  Future<void> selecionarMoedaOut(MoedaModel moeda) async {
    value = value.copyWith(moedaOut: moeda);
  }
  

}