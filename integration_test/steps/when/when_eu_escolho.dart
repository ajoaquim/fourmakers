// TODO Implement this library.
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenEuEscolho() {
  return when1<String, FlutterWidgetTesterWorld>(
    'Eu Escolho {string}',
        (operation, context) async {
      //final tester = context.world.rawAppDriver;
      //await tester.pumpAndSettle();
      //final finder = context.world.appDriver.findBy(operation, FindType.text);
      //await tester.tap(finder);
      //await tester.pump();
    },
  );
}