import 'dart:async';

import 'package:imc_calculator_history_app/app/blocs/imc_calculate_event.dart';
import 'package:imc_calculator_history_app/app/blocs/imc_calculate_state.dart';
import 'package:imc_calculator_history_app/app/models/person_imc.dart';
import 'package:imc_calculator_history_app/app/repositories/person_imc_repository.dart';
import 'package:intl/intl.dart';

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

    if (event is IMCCalculateLoadEvent) {
      iMCsList = await _repository.getIMCs();

    } else if (event is IMCCalculateAddIMCEvent) {
      final String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
      final double imc = calculateIMC(weight: event.weight, height: event.height);

      final String classification = switch (imc) {
        < 16 => 'Magreza grave',
        < 17 => 'Magreza moderada',
        < 18.5 => 'Magreza leve',
        < 25 => 'Saudável',
        < 30 => 'Sobrepeso',
        < 35 => 'Obesidade grau I',
        < 40 => 'Obesidade grau II (severa)',
        >= 40 => 'Obesidade grau III (mórbida)',
        _ => 'IMC não encontrado',
      };
      
      iMCsList = await _repository.saveIMC(personIMC: PersonIMC(height: event.height, weight: event.weight, imc: imc, classification: classification, date: date));

      return _output.add(IMCCalculateSuccessState(iMCsList: iMCsList, classification: classification, lastIMCCalculated: imc));
    } else if (event is IMCCalculateDeleteEvent) {
      iMCsList = await _repository.deleteIMC(id: event.id);
    }

    _output.add(IMCCalculateSuccessState(iMCsList: iMCsList));
  }

  double calculateIMC({required double weight, required double height}) {
    height = height / 100;
    return weight / (height * height);
  }
}