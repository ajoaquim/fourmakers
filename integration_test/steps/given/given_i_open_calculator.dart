StepDefinitionGeneric givenIOpenCalculator() {
  return given<FlutterWorld>(
    'I open calculator',
        (context) async {
      final finder =
      context.world.appDriver.findBy('btnCalculate', FindType.key);
      await context.world.appDriver.tap(finder);
    },
  );
}