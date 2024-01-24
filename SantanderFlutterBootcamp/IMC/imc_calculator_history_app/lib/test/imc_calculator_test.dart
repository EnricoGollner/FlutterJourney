import 'package:imc_calculator_history_app/app/blocs/imc_bloc.dart' as bloc;
import 'package:test/test.dart';

void main() {
  test('calculateIMC is correct!', () {
    expect(double.parse(bloc.IMCCalculateBloc().calculateIMC(weight: 60.23, height: 171).toStringAsFixed(2)), 20.60);
  });
}