import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/Pokemon.dart';

class PokemonAPI {
  Future<List<Pokemon>> getPokemons(int offsetCount) async {
    try {
      final url = Uri.parse(
          "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=$offsetCount");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)['results'];
        List<Pokemon> pokemons = [];
        for (int i = 0; i < data.length; i++) {
          final urlPokemon = Uri.parse("${data[i]['url']}");
          var responsePokemon = await http.get(urlPokemon);
          if (responsePokemon.statusCode == 200) {
            final id = jsonDecode(responsePokemon.body)['id'];
            final String name = jsonDecode(responsePokemon.body)['name'];
            final String image = jsonDecode(responsePokemon.body)['sprites']
                ['other']['dream_world']['front_default'];
            final List<String> types = [];
            jsonDecode(responsePokemon.body)['types'].forEach((t) {
              types.add(t['type']['name']);
            });
            final int height = jsonDecode(responsePokemon.body)['height'];
            final int weight = jsonDecode(responsePokemon.body)['weight'];
            late int generation = 0;
            if (id <= 151) {
              generation = 1;
            } else if (id <= 251) {
              generation = 2;
            } else if (id <= 385) {
              generation = 3;
            } else if (id <= 492) {
              generation = 4;
            } else if (id <= 648) {
              generation = 5;
            } else if (id <= 720) {
              generation = 6;
            } else if (id <= 808) {
              generation = 7;
            } else {
              generation = 8;
            }

            Pokemon p = Pokemon(
                position: id,
                name: name,
                image: image,
                types: types,
                height: height,
                weight: weight,
                generation: generation);
            pokemons.add(p);
          }
        }
        return pokemons;
      } else {
        return [];
      }
    } catch (error) {
      print(error);
      return [];
    }
  }
}
