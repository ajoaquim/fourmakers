import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher/url_launcher.dart';



StepDefinitionGeneric givenEuAcesso() {
  return given1<String, FlutterWidgetTesterWorld>(
    'Eu Acesso {string}',
        (text, context) async {
          //const url = 'https://fourmakers.app.foursys.com/homeDashboard';
         // if (await canLaunchUrl(Uri.parse(url))) {
           // await launchUrl(Uri.parse(url));
          //} else {
          //  throw 'Could not launch $url';
        //  }

      //await context.world.appDriver.waitForAppToSettle();

      //final finder = context.world.appDriver.findBy(
       // 'Fourmakers.io',
      //  FindType.text,
     // );

     // context.expect(finder, findsOneWidget);
    },

  );
}
