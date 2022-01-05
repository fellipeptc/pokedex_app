import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pokedex_app/modules/create_pokemon/create_pokemon_binding.dart';
import 'package:pokedex_app/modules/create_pokemon/create_pokemon_page.dart';
import 'package:pokedex_app/modules/home/home_binding.dart';
import 'package:pokedex_app/modules/home/home_page.dart';
import 'package:pokedex_app/modules/info_pokemon/info_pokemon_binding.dart';
import 'package:pokedex_app/modules/info_pokemon/info_pokemon_page.dart';
import 'package:pokedex_app/modules/splash_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: "/",
      page: () => SplashPage(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/infoPokemon',
      page: () => InfoPokemonPage(),
      binding: InfoPokemonBinding(),
    ),
    GetPage(
      name: '/createPokemon',
      page: () => CreatePokemonPage(),
      binding: CreatePokemonBinding(),
    )
  ];
}
