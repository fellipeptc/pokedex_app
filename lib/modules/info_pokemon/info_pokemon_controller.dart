import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/widgets/custom_snackbar.dart';
import 'package:pokedex_app/models/Pokemon.dart';
import 'package:pokedex_app/repositories/pokemon_amplify.dart';

class InfoPokemonController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final hpController = TextEditingController();
  final manaController = TextEditingController();
  final attackController = TextEditingController();
  final defenseController = TextEditingController();
  final generationController = TextEditingController();

  final pokemonAmplify;
  InfoPokemonController(this.pokemonAmplify);

  @override
  void onClose() {
    // TODO: implement onClose
    Get.appUpdate();
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _infoPokemon();
    super.onInit();
  }

  _infoPokemon() {
    final pokemon = Get.arguments;
    heightController.text = pokemon.height.toString();
    weightController.text = pokemon.weight.toString();
    generationController.text = pokemon.generation.toString();
  }

  savePokemonApiToAmplify(Pokemon pokemon) async {
    final p = Pokemon(
        position: pokemon.position,
        name: pokemon.name,
        types: pokemon.types,
        image: pokemon.image,
        weight: pokemon.weight,
        height: pokemon.height,
        generation: pokemon.generation);

    final List<Pokemon> pokemonExists =
        await PokemonAmplify.selectPokemonPosition(p);
    if (pokemonExists.isEmpty || pokemonExists.isNull) {
      PokemonAmplify.savePokemon(p);
      CustomSnackBar.getSnackBar("POKEMÓN SALVO!",
          "Pokemón da API salvo na AWS.", Icons.done, Colors.blueAccent);
    } else {
      CustomSnackBar.getSnackBar("POKEMÓN JÁ EXISTE!",
          "Pokemón já existe na base da AWS.", Icons.info, Colors.orangeAccent);
    }
  }
}
