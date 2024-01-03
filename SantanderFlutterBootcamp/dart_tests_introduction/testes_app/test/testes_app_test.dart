import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testes_app/testes_app.dart' as app;
import 'package:test/test.dart';
import 'package:testes_app/viacep.dart';

import 'testes_app_test.mocks.dart';

@GenerateMocks([MockViaCep])
void main() {
  test('Calcula o valor do produto com desconto SEM porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  test('Calcula o valor do produto com desconto COM porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  group('Calcula o valor do produto com desconto: ', () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 150, 'percentual': true}: 850,
    };

    valuesToTest.forEach((values, expected) {
      test('Entrada: $values - Esperado: $expected', () {
        expect(
          app.calcularDesconto(
            double.parse(values['valor'].toString()),
            double.parse(values['desconto'].toString()),
            values['desconto'] == true,
          ),
          equals(expected),
        );
      });
    });
  });

  group(
      'Calculando o valor do produto informando valores zerados, deve gerar erro',
      () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true},
    };

    for (var values in valuesToTest) {
      test('Entrada: $values', () {
        expect(
            () => app.calcularDesconto(
                double.parse(values['valor'].toString()),
                double.parse(values['desconto'].toString()),
                values['percentual'] == true),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('Testando ignoring case', () {
    expect('dio', equalsIgnoringCase('DIO'));
  });

  test('Testando primeira letra', () {
    expect('DIO', startsWith('D'));
  });

  test('Retorna CEP', () async {
    MockMockViaCep mockViaCep = MockMockViaCep();

    when(mockViaCep.retornarCEP('01001000'))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "01001-000",
              "logradouro": "Praça da Sé",
              "complemento": "lado ímpar",
              "bairro": "Sé",
              "localidade": "São Paulo",
              "uf": "SP",
              "ibge": "3550308",
              "gia": "1004",
              "ddd": "11",
              "siafi": "7107"
            }));

    var body = await ViaCep().retornarCEP('01001000');
    expect(body['bairro'], equals('Sé'));
    expect(body['logradouro'], equals('Praça da Sé'));
  });
}

class MockViaCep extends Mock implements ViaCep {}
