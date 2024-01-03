import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/app/utils/hive_db_util.dart';

class NumberController extends ValueNotifier<int> {
  NumberController() : super(0);

  Future<void> generateNewNumber() async {
    value = Random().nextInt(100);

    if (Hive.isBoxOpen(HiveDB.boxGeneratedNumber)) {
      await Hive.box(HiveDB.boxGeneratedNumber).put(HiveDB.generatedNumberKey, value);
    } else {
      await Hive.openBox(HiveDB.boxGeneratedNumber);
    }
  }

  Future<void> getLastSaved() async {
    if (Hive.isBoxOpen(HiveDB.boxGeneratedNumber)) {
      value = await Hive.box(HiveDB.boxGeneratedNumber).get(HiveDB.generatedNumberKey) ?? 0;
    }
  }
}