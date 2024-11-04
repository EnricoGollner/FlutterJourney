import 'package:flutter/material.dart';
import 'package:test_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home Page E2E Test', () {
    testWidgets('Clique 5x no FAB Incrementar', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      for (var i = 0; i < 5; i++) {
        await tester.tap(find.byIcon(Icons.plus_one));
        await Future.delayed(const Duration(seconds: 1));
      }

      await tester.pumpAndSettle();

      expect(find.text('5'), findsOneWidget);
    });
  });

  testWidgets(
    'Change Title on HomePage',
    (tester) async {
      app.main();
      await tester.pumpAndSettle();

      Text titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
      expect(titulo.data, equals('Home'));

      await tester.enterText(find.byKey(const Key('tituloInput')), 'Home Page');
      await tester.pumpAndSettle();

      titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
      expect(titulo.data, equals('Home Page'));
    },
  );
}
