import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenEuAcesso() {
  return given1<String, FlutterWorld>(
    'Eu Acesso {string}',
        (text, context) async {
      final finder =
      context.world.appDriver.findBy(text, FindType.text);
      await context.world.appDriver.tap(finder);
    },
  );
}
