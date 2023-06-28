StepDefinitionGeneric givenITap() {
return given1<String, FlutterWorld>(
'I type {string}',
(value, context) async {
final finder = context.world.appDriver.findBy('txtName', FindType.key);
await context.world.appDriver.enterText(
finder,
value,
);
},
);
}