import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/constants/type_pokemons.dart';
import 'package:pokedex_app/modules/home/home_controller.dart';

@immutable
class PokemonTile extends GetView<HomeController> {
  final _pokemon;
  const PokemonTile(this._pokemon);

  @override
  Widget build(BuildContext context) {
    String _primaryType = _pokemon.types[0];
    var _secundaryType;
    if (_pokemon.types.length > 1) _secundaryType = _pokemon.types[1];
    return InkWell(
      onTap: () {
        controller.goToInfoPokemonPage(_pokemon);
      },
      child: Card(
          elevation: 5.0,
          color: TypesPokemon.colorBack(_primaryType),
          margin: const EdgeInsets.all(5.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: -50.0,
                right: -40.0,
                child: Image.asset(
                  "assets/images/pokeball.png",
                  height: 150.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Hero(
                      tag: 'pokemon${_pokemon.id}',
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        height: 110.0,
                        width: 110.0,
                        child: SvgPicture.network("${_pokemon.image}"),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "#${_pokemon.position} ",
                                style: TextStyle(
                                    color: TypesPokemon.colorText(_primaryType),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${_pokemon.name.toUpperCase()}",
                                style: TextStyle(
                                    color: TypesPokemon.colorText(_primaryType),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3.0,
                                      color:
                                          TypesPokemon.colorText(_primaryType)),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    _primaryType.toUpperCase(),
                                    style: TextStyle(
                                        color: TypesPokemon.colorText(
                                            _primaryType),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              _secundaryType != null
                                  ? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3.0,
                                            color: TypesPokemon.colorText(
                                                _primaryType)),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "${_secundaryType.toUpperCase()}",
                                          style: TextStyle(
                                              color: TypesPokemon.colorText(
                                                  _primaryType),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "${_pokemon.height} ft & ${_pokemon.weight} lb",
                            style: TextStyle(
                                color: TypesPokemon.colorText(_primaryType),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
