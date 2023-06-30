import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenEuDigito() {
  return when1<String, FlutterWorld>(
    'Eu Digito {string}',
        (value, context) async {
      final finder = context.world.appDriver.findBy('txtName', FindType.key);
      await context.world.appDriver.enterText(
        finder,
        value,
      );
    },
  );
}