import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salary_timer/app/models/holiday.dart';
import 'package:salary_timer/app/repositories/main_repository.dart';

class MainController {
  final MainRepository _repository = MainRepository();

  final ValueNotifier<AppState> _state = ValueNotifier(AppState.loading);
  ValueNotifier<AppState> get state => _state;

  final ValueNotifier<List<Holiday>> _holidays = ValueNotifier([]);
  List<Holiday> get holidays => _holidays.value;

  Future<String?> getHolidays({required int year}) async {
    final result = await _repository.getHolidays(year);

    if (result.mensagemErro != null) {
      state.value = AppState.error;
      return result.mensagemErro!;
    }

    _holidays.value = result.holidays!;
    state.value = AppState.success;
    return null;
  }

  bool isHoliday({required int day, required int month}) {
    for (Holiday holiday in holidays) {
      if (holiday.date.day == day && holiday.date.month == month) return true;
    }

    return false;
  }

  ///Método para obter o dia do salário
  ///- normalmente sendo o 5° dia útil, porém, caso tiver um sábado, também é contado
  DateTime getNextSalaryDate(int year, int month) {
    int businessDaysCount = 0;
    DateTime date = DateTime(year, month, 1);

    while (businessDaysCount < 5) {
      if (date.weekday != DateTime.sunday && !isHoliday(day: date.day, month: date.month)) businessDaysCount++;
      if (businessDaysCount < 5) date = date.add(const Duration(days: 1));
    }

    // if (DateTime.now().isAfter(date)) return getNextSalaryDate(date.year, date.month + 1);

    return date;
  }
}

enum AppState {
  loading, success, error
}
