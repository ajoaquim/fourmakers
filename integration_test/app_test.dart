import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import  'package:fourmakers_2/main.dart' as app;

void main() {
   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Home Page Inicial', () {
    testWidgets('Valida Pagina do Login', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();


      await tester.pumpAndSettle();

      expect(find.text('Entrar com a conta da Microsoft'), findsOneWidget);
    });
  });

  testWidgets('Valida Acesso Com Microsoft', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    var titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
    expect(titulo.data, equals('Home'));

    // Possível bug do enterText no iPad (por conta do keyboard)
    // await Future.delayed(const Duration(seconds: 2));
    // await tester.enterText(find.byKey(const Key('tituloInput')), 'Home Page');
    // await Future.delayed(const Duration(seconds: 2));
    // await tester.pumpAndSettle();
    // await Future.delayed(const Duration(seconds: 2));

    // titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
    // expect(titulo.data, equals('Home Page'));
  });
}
