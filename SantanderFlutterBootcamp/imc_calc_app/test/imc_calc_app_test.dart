import 'package:imc_calc_app/imc_calc_app.dart';
import 'package:test/test.dart';

void main() {
  test('imcCalculate', () {
    expect(double.parse(calculateImc(weight: 60.23, height: 171 / 100).toStringAsFixed(2)), 20.60);
  });
}
