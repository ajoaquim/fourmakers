// TODO Implement this library.
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric thenEuEsperoResultado() {
  return then1<String, FlutterWorld>(
    'Eu Espero Resultado {string}',
        (text, context) async {
      //await context.world.appDriver.waitForAppToSettle();

      //final finder = context.world.appDriver.findBy(
        //text,
        //FindType.text,
      //);

      //context.expect(finder, findsOneWidget);
    },
  );
}