import 'dart:io';
import 'package:intl/intl.dart';

class Formatters {
  static String doubleToCurrency(double value, {bool isAsFixedZero = false}) {
    String symbol = 'R\$';

    if (isAsFixedZero) {
      if (value == 0) {
        return '0,00';
      } else {
        final currentFormatter = NumberFormat('##,###');
        return symbol + currentFormatter.format(value);
      }
    } else {
      return NumberFormat.currency(symbol: symbol, locale: Platform.localeName).format(value);
    }
  }

  static String dateTimeToString({required DateTime date}) {
    DateFormat('dd/MM/yyyy hh:mm').format(date);

    return Platform.localeName == 'pt_BR' ? DateFormat('dd/MMMM/yyyy hh:mm').format(date) : DateFormat('MMMM dd, y - hh:mm a').format(date);
  }
}
