StepDefinitionGeneric thenIExpectResult() {
  return then1<String, FlutterWorld>(
    'I expect result {string}',
        (text, context) async {
      await context.world.appDriver.waitForAppToSettle();

      final finder = context.world.appDriver.findBy(
        text,
        FindType.text,
      );

      context.expect(finder, findsOneWidget);
    },
  );
}