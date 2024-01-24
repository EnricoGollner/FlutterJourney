import 'dart:io';

import 'package:intl/intl.dart';

class Formatters {
  static String numberToDecimal(num value) {
    if (value == 0) {
      return Platform.localeName == 'pt_BR' ? '0,00' : '0.00';
    } else {
      final currentFormatter = NumberFormat('##,##0.00', Platform.localeName);
      return currentFormatter.format(value);
    }
  }

  static double stringToDouble({required String value}) {
    String textToDouble = value;

    if (Platform.localeName == 'pt_BR') {
      textToDouble = value.replaceAll('.', '');
      textToDouble = textToDouble.replaceAll(',', '.');
    } else if (Platform.localeName == 'en_US') {
      textToDouble = value.replaceAll(',', '');
    }

    return double.parse(textToDouble);
  }
}