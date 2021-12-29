import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/services/amplify_manager.dart';

import 'app/routes/app_routes.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await AmplifyManager().configureAmplify();

  return runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.native,
    locale: const Locale('pt', 'BR'),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    getPages: AppRoutes.routes,
  ));
}
