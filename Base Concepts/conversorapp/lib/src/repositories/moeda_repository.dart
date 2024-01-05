
import 'dart:convert';

import 'package:conversorapp/src/models/moeda_model.dart';
import 'package:http/http.dart';
import 'package:xml/xml.dart';

class MoedaRepository {
  final _baseUrl = 'https://economia.awesomeapi.com.br';
  final _client = Client();

  Future<List<MoedaModel>> getMoedas() async {
    final response = await _client.get(Uri.parse('$_baseUrl/xml/available'));
    final xmlRaw = response.body;

    return parseMoedas(xmlRaw);
  }

  List<MoedaModel> parseMoedas(String xmlRaw) {
    final document = XmlDocument.parse(xmlRaw);

    final elements = document.children.first.children.whereType<XmlElement>();
    final listaMoedas = <MoedaModel>[];

    for (var element in elements) {
      final model = MoedaModel(name: element.localName, code: element.innerText);
      listaMoedas.add(model);
    }

    return listaMoedas;
  }

  Future<double> cotacao(MoedaModel moedaIn, MoedaModel moedaOut) async {
    final search = '${moedaIn.code}-${moedaOut.code}';

    final response = await _client.get(Uri.parse('$_baseUrl/json/last/$search'));
    final jsonRaw = response.body;

    return parseCotacao(jsonRaw, search);
  }

  double parseCotacao(String jsonRaw, String search) {
    search = search.replaceFirst('-', '');

    final json = jsonDecode(jsonRaw);
    final model = json[search];
    final cotacao = model['bid'];
    return double.parse(cotacao);


  }
  
}