import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:local_persistence_with_shared_preferences_app/app/shared/error/failure.dart';
import 'package:local_persistence_with_shared_preferences_app/app/shared/utils/db_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenerateNumberRepository {
  Future<int> generateAndSaveNumber() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final int generatedNumber = Random().nextInt(50);
    await storage.setInt(DBUtils.newGeneratedNumberKey, generatedNumber);

    return generatedNumber;
  }

  Future<Either<Failure, int>> getLastSavedNumber() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    int? numberSaved = storage.getInt(DBUtils.newGeneratedNumberKey);

    return numberSaved != null
        ? Right(numberSaved)
        : Left(Failure(message: 'No data saved!'));
  }
}
