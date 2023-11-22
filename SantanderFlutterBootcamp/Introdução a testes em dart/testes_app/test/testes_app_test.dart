import 'package:testes_app/testes_app.dart' as app;
import 'package:test/test.dart';

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
}
