import 'package:flutter_gherkin/flutter_gherkin.dart'; // notice new import name
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

// The application under test.
import 'package:fourmakers_2/main.dart' as app;
import 'steps/when/when_eu_digito.dart';
import 'steps/when/when_eu_escolho.dart';
import 'steps/given/given_eu_acesso.dart';
import 'steps/then/then_eu_espero_resultado.dart';
import 'steps/then/then_eu_fecho_alerta.dart';
import 'steps/when/when_eu_pressiono.dart';
part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      stepDefinitions: [
        givenEuAcesso(),
        thenEuEsperoResultado(),
        thenEuFechoAlerta(),
        whenEuDigito(),
        whenEuEscolho(),
        whenEuPressiono()
      ],
      order: ExecutionOrder.alphabetical,
      features: [RegExp('features/*.*.feature')],
      reporters: [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        ProgressReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        TestRunSummaryReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        JsonReporter(
          writeReport: (_, __) => Future<void>.value(),
        )
      ],
    ),
    appMainFunction: (World world) async => app.main(),
  );
}