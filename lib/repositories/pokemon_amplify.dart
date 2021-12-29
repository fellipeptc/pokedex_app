import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:pokedex_app/models/Pokemon.dart';

class PokemonAmplify {
  static selectPokemonPosition(Pokemon pokemon) async {
    try {
      List<Pokemon> pokemons = await Amplify.DataStore.query(Pokemon.classType,
          where: Pokemon.POSITION.eq(pokemon.position));
      return pokemons;
    } catch (e) {
      print("Could not query DataStore: $e");
    }
  }

  static selectAllPokemons() async {
    try {
      List<Pokemon> pokemons = await Amplify.DataStore.query(Pokemon.classType,
          sortBy: [Pokemon.POSITION.ascending()]);
      return pokemons;
    } catch (e) {
      print("Could not query DataStore: $e");
    }
  }

  static savePokemon(Pokemon pokemon) async {
    try {
      await Amplify.DataStore.save(pokemon);
      print("POKEMON SALVO COM SUCESSO NA AWS!");
    } catch (e) {
      print("Erro ao salvar. -> $e");
      throw e;
    }
  }

  static deletePokemon(Pokemon pokemon) async {
    try {
      await Amplify.DataStore.delete(pokemon);
      print("POKEMON DELETADO COM SUCESSO NA AWS!");
    } on DataStoreException catch (e) {
      print('Delete failed: $e');
    }
  }
}
