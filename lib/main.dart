import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'amplify_outputs.dart';
import 'infrastructure/dal/services/aws/aws_service.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'models/ModelProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initialRoute = await Routes.initialRoute;
  try {
    await _configureAmplify();
    AWSServiceC.setupServiceLocator();
    runApp(Main(initialRoute));
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

// Future<void> _configureAmplify() async {
//   try {
//
//     await Amplify.addPlugin(AmplifyAuthCognito());
//     await Amplify.configure(amplifyConfig);
//     safePrint('Successfully configured');
//   } on Exception catch (e) {
//     safePrint('Error configuring Amplify: $e');
//   }
// }

Future<void> _configureAmplify() async {
  try {
    // final datastorePlugin =
    //     AmplifyDataStore(modelProvider: ModelProvider.instance);
    final api = AmplifyAPI(
        options: APIPluginOptions(modelProvider: ModelProvider.instance));
    await Amplify.addPlugins([api, AmplifyAuthCognito()]);

    await Amplify.configure(amplifyConfig);

    safePrint('Successfully configured Amplify');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
    );
  }
}
