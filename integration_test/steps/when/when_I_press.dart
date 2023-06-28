StepDefinitionGeneric whenIPressNumber() {
  return when1<int, FlutterWidgetTesterWorld>(
    'I press number {int}',
        (number, context) async {
      final tester = context.world.rawAppDriver;
      await tester.pumpAndSettle();
      final finder = context.world.appDriver.findBy('btn$number', FindType.key);
      await tester.tap(finder);
      await tester.pump();
    },
  );
}

StepDefinitionGeneric whenIPressOperation() {
  return when1<String, FlutterWidgetTesterWorld>(
    'I press operation {string}',
        (operation, context) async {
      final tester = context.world.rawAppDriver;
      await tester.pumpAndSettle();
      final finder = context.world.appDriver.findBy(operation, FindType.text);
      await tester.tap(finder);
      await tester.pump();
    },
  );
}