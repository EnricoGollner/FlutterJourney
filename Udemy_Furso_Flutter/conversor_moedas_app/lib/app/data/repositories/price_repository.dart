import 'dart:convert';
import 'package:http/http.dart';
import '../http/http_client.dart';

abstract class IPriceRepository {
  Future<Map<String, dynamic>> getPrices();
}

class PriceRepository implements IPriceRepository {
  final String url = "https://api.hgbrasil.com/finance?key=2a14772a";

  @override
  Future<Map<String, dynamic>> getPrices() async {
    final httpClient = HttpClient();
    final Response response = await httpClient.get(url: url);

    // final Map<String, dynamic> resultsBR =
    //     jsonDecode(response.body)["results"]["currencies"]["BRL"]["sell"];
    // final Map<String, dynamic> resultsUSD =
    //     jsonDecode(response.body)["results"]["currencies"]["USD"]["sell"];
    // final Map<String, dynamic> resultsEUR =
    //     jsonDecode(response.body)["results"]["currencies"]["USD"]["sell"];

    return jsonDecode(response.body);
  }
}
