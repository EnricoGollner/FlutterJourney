import 'package:imc_calculator_history_app/app/models/person_imc.dart';
import 'package:imc_calculator_history_app/app/repositories/person_imc_repository.dart';
import 'package:intl/intl.dart';

class IMCCalculateController {
  final PersonIMCRepository _repository = PersonIMCRepository();

  Future<void> calculateIMC({required double weight, required double height}) async {
    final double imc = weight / (height * height);

    print(imc);
    // await _saveIMC(height: height, weight: weight, imc: imc);
  }

  Future<void> _saveIMC({required double weight, required double height, required double imc}) async {
    String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
    await _repository.saveIMC(personIMC: PersonIMC(id: 0, height: height, weight: weight, imc: imc, date: date));
  }
}
