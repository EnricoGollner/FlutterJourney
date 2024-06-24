import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:salary_timer/app/models/holiday.dart';

class MainRepository {
  Future<({List<Holiday>? holidays, String? mensagemErro})> getHolidays(int year) async {
    try {
      final Response result = await Dio().get(
        'https://api.invertexto.com/v1/holidays/$year',
        queryParameters: {
          'token': dotenv.get('API_HOLIDAY_TOKENS'),
          'state': 'ES',
        },
      );

      final List<Holiday> holidays = (result.data as List).map((holiday) => Holiday.fromJson(holiday)).toList();
      return (holidays: holidays, mensagemErro: null);
    } catch (error) {
      return (holidays: null, mensagemErro: error.toString());
    }
  }
}
