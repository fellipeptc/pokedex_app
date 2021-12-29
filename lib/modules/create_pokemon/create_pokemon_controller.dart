import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/models/Pokemon.dart';
import 'package:pokedex_app/repositories/pokemon_amplify.dart';

class CreatePokemonController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final RxString typePokemon = "".obs;

  final pokemonAmplify;
  CreatePokemonController(this.pokemonAmplify);

  @override
  void onInit() {
    nameController.text = "";
    weightController.text = "";
    heightController.text = "";
    super.onInit();
  }

  savePokemon() async {
    final pokemon = Pokemon(
        position: -1,
        name: nameController.text,
        types: [typePokemon.value],
        image: "Lorem ipsum dolor sit amet",
        weight: int.parse(weightController.text),
        height: int.parse(heightController.text),);
    PokemonAmplify.savePokemon(pokemon);
  }
}
