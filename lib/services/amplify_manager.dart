import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/models/ModelProvider.dart';


import '../amplifyconfiguration.dart';

class AmplifyManager extends GetxController {
  configureAmplify() async {
    try {
      await Amplify.addPlugins([
        AmplifyDataStore(modelProvider: ModelProvider.instance),
        AmplifyAPI()
      ]);

      await Amplify.configure(amplifyconfig);
      print("Configured");
    } on AmplifyAlreadyConfiguredException {
      print(
          "Amplify was already configured. Looks like app restarted on android.");
    } catch (err) {
      print(err);
    }
  }
}
