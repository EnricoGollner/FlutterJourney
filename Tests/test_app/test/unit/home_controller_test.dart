import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/pages/home/home_controller.dart';

void main() {
  group('Test HomeController', () {
    late HomeController controller;
    setUp(() => controller = HomeController());

    test('Contador deve inicializar em 0', () {
      expect(controller.counter.value, 0);
    });
    test('Incrementar o contador em 1x', () {
      controller.counter.value++;
      expect(controller.counter.value, 1);
    });
    test('Titulo inicial deve ser Home', () {
      expect(controller.titulo.value, 'Home');
    });
    test('Alterar o titulo Home para Home Page', () {
      controller.titulo.value = 'Home Page';
      expect(controller.titulo.value, 'Home Page');
    });
  });
}