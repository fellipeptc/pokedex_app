import 'package:get/get.dart';
import 'package:pokedex_app/repositories/pokemon_api.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      final PokemonAPI api = PokemonAPI();
      return HomeController(api);
    });
  }
}