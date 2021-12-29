import 'package:get/get.dart';
import 'package:pokedex_app/repositories/pokemon_amplify.dart';

import 'create_pokemon_controller.dart';

class CreatePokemonBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(()=>CreatePokemonController(PokemonAmplify()));
    Get.put(CreatePokemonController(PokemonAmplify()));
  }
}