import 'package:dev_venture/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('true/false question validates answer and allows retry',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Verdadeiro ou Falso'), findsOneWidget);
    expect(find.text('Acertos'), findsOneWidget);
    expect(find.text('Tentativas'), findsOneWidget);

    await tester.tap(find.text('Falso'));
    await tester.pumpAndSettle();

    expect(find.text('Incorreto. Tente novamente.'), findsOneWidget);
    expect(find.text('Tentar novamente'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('Falso'));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('Tentar novamente'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Verdadeiro'));
    await tester.pumpAndSettle();

    expect(find.text('Correto! Você acertou a questão.'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });
}
