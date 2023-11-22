import 'package:http/http.dart' as http;
import 'dart:convert';

class ViaCep {
  Future<Map<dynamic, dynamic>> retornarCEP(String cep) async {
    var uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var response = await http.get(uri);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);
    return decodedResponse;
  }
}
