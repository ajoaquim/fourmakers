import 'package:flutter_gherkin/flutter_gherkin.dart'; // notice new import name
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

// The application under test.
import 'package:fourmakers_2/main.dart' as app;

import 'steps/given/given_I_tap.dart';
import 'steps/given/given_i_open_calculator.dart';
import 'steps/then/then_I_expect_result.dart';
import 'steps/when/when_I_press.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      stepDefinitions: [givenIOpenCalculator(),
        givenITap(),
        whenIPressNumber(),
        whenIPressOperation(),
        thenIExpectResult()
      ],
      order: ExecutionOrder.sequential,
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