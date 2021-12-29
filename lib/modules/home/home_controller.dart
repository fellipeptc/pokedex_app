import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/widgets/custom_snackbar.dart';
import 'package:pokedex_app/models/Pokemon.dart';
import 'package:pokedex_app/repositories/pokemon_amplify.dart';
import 'package:pokedex_app/repositories/pokemon_api.dart';

class HomeController extends GetxController {
  RxList<Pokemon> pokemonsApi = <Pokemon>[].obs;
  RxList<Pokemon> pokemonsAmplify = <Pokemon>[].obs;
  RxBool isLoading = true.obs;
  int offsetCount = 0;

  ScrollController scrollController = ScrollController();
  ScrollController scrollController2 = ScrollController();

  final PokemonAPI api;
  HomeController(this.api);

  @override
  void onInit() {
    getPokemonListAPi();
    addPokemonList();
    getPokemonListAmplify();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getPokemonListAmplify();
    super.onReady();
  }

  goToCreatePokemonPage() =>
      Get.toNamed("/createPokemon", arguments: pokemonsApi);

  goToInfoPokemonPage(pokemon) =>
      Get.toNamed("/infoPokemon", arguments: pokemon);

  getPokemonListAPi() async {
    pokemonsApi.value = await api.getPokemons(offsetCount);
  }

  addPokemonList() async {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        offsetCount += 20;
        List<Pokemon> morePokemons = await api.getPokemons(offsetCount);
        pokemonsApi = pokemonsApi + morePokemons;
        update(); // atualize GetBuilder a cada vez
      }
    });
  }

  getPokemonListAmplify() async {
    pokemonsAmplify.value = await PokemonAmplify.selectAllPokemons();
  }

  removePokemonAmplify(Pokemon pokemon) async {
    await PokemonAmplify.deletePokemon(pokemon);
    getPokemonListAmplify();
    update();
    CustomSnackBar.getSnackBar("POKEMÓN REMOVIDO!",
        "Pokemón deletado da base AWS.", Icons.delete, Colors.blueAccent);
  }
}
