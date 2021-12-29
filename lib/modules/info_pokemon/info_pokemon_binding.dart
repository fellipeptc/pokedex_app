import 'package:get/get.dart';
import 'package:pokedex_app/modules/home/home_controller.dart';
import 'package:pokedex_app/repositories/pokemon_amplify.dart';
import 'package:pokedex_app/repositories/pokemon_api.dart';

import 'info_pokemon_controller.dart';


class InfoPokemonBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(()=>CreatePokemonController(PokemonAmplify()));
    Get.put(InfoPokemonController(PokemonAmplify()));
    Get.lazyPut<HomeController>(() {
      return HomeController(PokemonAPI());
    });
  }
}