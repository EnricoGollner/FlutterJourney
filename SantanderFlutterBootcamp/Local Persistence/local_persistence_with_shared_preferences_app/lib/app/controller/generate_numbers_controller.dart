import 'package:flutter/material.dart';
import 'package:local_persistence_with_shared_preferences_app/app/shared/repositories/generate_number_repository.dart';

class GenerateNumberController extends ChangeNotifier {
  int _generatedNumber = 0;
  final List<int> _generatedNumbersList = [];

  int get lastGeneratedNumber => _generatedNumber;
  List<int> get generatedNumbersList => _generatedNumbersList;

  final GenerateNumberRepository _repository = GenerateNumberRepository();

  Future<void> generateAndSavenumber() async {
    final int number = await _repository.generateAndSaveNumber();
    _generatedNumbersList.add(number);

    await getLastSavedNumber();

    notifyListeners();
  }

  Future<String> getLastSavedNumber() async {
    String? errorMessage;

    await _repository.getLastSavedNumber().then((value) {
      value.fold(
        (error) => errorMessage = error.message,
        (number) => _generatedNumber = number,
      );
    });

    return errorMessage ?? '';
  }
}
