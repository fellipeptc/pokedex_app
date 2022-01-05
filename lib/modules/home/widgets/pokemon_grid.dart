import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/constants/type_pokemons.dart';
import 'package:pokedex_app/models/Pokemon.dart';
import 'package:pokedex_app/modules/home/home_controller.dart';

class PokemonGrid extends GetView<HomeController> {
  final Pokemon _pokemon;
  const PokemonGrid(this._pokemon, {Key? key}) : super(key: key);

  _buildBgDeleteItem() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.redAccent,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "REMOVER",
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }

  _buildCard() {
    String _primaryType = _pokemon.types![0];
    return GestureDetector(
      onTap: () {
        controller.goToInfoPokemonPage(_pokemon);
      },
      child: Card(
        elevation: 5.0,
        color: TypesPokemon.colorBack(_primaryType),
        margin: const EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              bottom: -50.0,
              right: -40.0,
              child: Image.asset(
                "assets/images/pokeball.png",
                height: 150.0,
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "#${_pokemon.position} ",
                      style: TextStyle(
                          color: TypesPokemon.colorText(_primaryType),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _pokemon.name!.toUpperCase(),
                      style: TextStyle(
                          color: TypesPokemon.colorText(_primaryType),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Hero(
                  tag: 'pokemon${_pokemon.id}',
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    child: SvgPicture.network(
                      "${_pokemon.image}",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(_pokemon.id),
      background: _buildBgDeleteItem(),
      onDismissed: (direction) async {
        await controller.removePokemonAmplify(_pokemon);
      },
      child: _buildCard(),
    );
  }
}
