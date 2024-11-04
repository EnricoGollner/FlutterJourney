import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/main.dart';
import 'package:test_app/pages/home/home_page.dart';

void main() {
  testWidgets('Increment Counter on HomePage', (tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();

    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  },);

  testWidgets('Change Title on HomePage', (tester) async {
    await tester.pumpWidget(const MainApp());

    Text titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;

    expect(find.byType(HomePage), findsOneWidget);
    expect(titulo.data, equals('Home'));

    await tester.enterText(find.byKey(const Key('tituloInput')), 'Home Page');
    await tester.pumpAndSettle();

    titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
    expect(titulo.data, equals('Home Page'));
  },); 
}