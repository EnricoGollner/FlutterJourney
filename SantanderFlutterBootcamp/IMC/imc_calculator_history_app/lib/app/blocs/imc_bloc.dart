import 'dart:async';

import 'package:imc_calculator_history_app/app/blocs/imc_calculate_event.dart';
import 'package:imc_calculator_history_app/app/blocs/imc_calculate_state.dart';
import 'package:imc_calculator_history_app/app/models/person_imc.dart';
import 'package:imc_calculator_history_app/app/repositories/person_imc_repository.dart';

class IMCCalculateBloc {
  final PersonIMCRepository _repository = PersonIMCRepository();

  final StreamController<IMCCalculateEvent> _input = StreamController<IMCCalculateEvent>();
  final StreamController<IMCCalculateState> _output = StreamController<IMCCalculateState>();

  Sink<IMCCalculateEvent> get input => _input.sink;
  Stream<IMCCalculateState> get stream => _output.stream;

  IMCCalculateBloc() {
    _input.stream.listen(_mapEventToState);
  }

  Future<void> _mapEventToState(IMCCalculateEvent event) async {
    List<PersonIMC> iMCsList = List<PersonIMC>.empty();
    _output.add(IMCCalculateLoadingState(iMCsList: []));
    String classificacao = '';

    if (event is IMCCalculateLoadEvent) {
      await _repository.getIMCs().then((iMCsList) {
        iMCsList.addAll(iMCsList);
      }).catchError((error) {
        _output.add(IMCCalculateFailureState(message: error.toString(), iMCsList: iMCsList));
      });

    } else if (event is IMCCalculateAddIMCEvent) {
      // final String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
      final double imc = calculateIMC(weight: event.weight, height: event.height);

      // await _repository.saveIMC(personIMC: PersonIMC(height: event.height, weight: event.weight, imc: imc, date: date));
      if (imc < 16) {
        classificacao = 'Magreza grave';
      } else if (imc < 17) {
        classificacao = 'Magreza moderada';
      } else if (imc < 18.5) {
        classificacao = 'Magreza leve';
      } else if (imc < 25) {
        classificacao = 'Saudável';
      } else if (imc < 30) {
        classificacao = 'Sobrepeso';
      } else if (imc < 35) {
        classificacao = 'Obesidade grau I';
      } else if (imc < 40) {
        classificacao = 'Obesidade grau II (severa)';
      } else {
        classificacao = 'Obesidade grau III (mórbida)';
      }

      return _output.add(IMCCalculateSuccessState(iMCsList: iMCsList, classificacao: classificacao, lastIMCCalculated: imc));
    } else if (event is IMCCalculateDeleteEvent) {
      await _repository.deleteIMC(id: event.id);
    }

    _output.add(IMCCalculateSuccessState(iMCsList: iMCsList, classificacao: classificacao));
  }

  double calculateIMC({required double weight, required double height}) {
    height = height / 100;
    return weight / (height * height);
  }
}