import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/constants/app_constants.dart';
import 'package:pokedex_app/app/constants/type_pokemons.dart';
import 'package:pokedex_app/app/widgets/custom_drawer.dart';
import 'package:pokedex_app/app/widgets/custom_text_form_field.dart';
import 'package:pokedex_app/models/Pokemon.dart';

import 'info_pokemon_controller.dart';

class InfoPokemonPage extends GetView<InfoPokemonController> {
  final _pokemon = Get.arguments;
  InfoPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 0,
      appBar: AppBar(
        title: const Text(
          "POKEDÉX",
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: [
          GestureDetector(
              onTap: () {
                controller.savePokemonApiToAmplify(_pokemon);
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              )),
          GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      drawer: const CustomDrawer(),
      body: _buildInfo(),
    );
  }

  _buildInfo() {
    String _primaryType = _pokemon.types[0];
    var _secundaryType;
    if (_pokemon.types.length > 1) _secundaryType = _pokemon.types[1];

    return Container(
      color: TypesPokemon.colorBack(_pokemon.types[0]),
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                  bottom: Get.height * 0.30,
                  right: Get.height * -0.10,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/images/pokeball.png",
                      height: Get.height * 0.5,
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              _pokemon is Pokemon
                  ? Positioned(
                      right: Get.height * 0.03,
                      top: Get.height * 0.03,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3.0,
                              color: TypesPokemon.colorText(_primaryType)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            _pokemon.generation != null ? "1ºGen" : " Not Gen.",
                            style: AppTextSyles.getTextStyle(
                                TypesPokemon.colorText(_primaryType)),
                          ),
                        ),
                      ))
                  : Container()
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'pokemon${_pokemon.id}',
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        height: Get.height * 0.2,
                        width: Get.height * 0.2,
                        child: SvgPicture.network("${_pokemon.image}"),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "#${_pokemon.position} - ${_pokemon.name.toUpperCase()}",
                      style: AppTextSyles.getTextStyle(
                          TypesPokemon.colorText(_primaryType)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 3.0,
                                color: TypesPokemon.colorText(_primaryType)),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              _primaryType.toUpperCase(),
                              style: TextStyle(
                                  color: TypesPokemon.colorText(_primaryType),
                                  fontSize: 20.0,
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
                                      color:
                                          TypesPokemon.colorText(_primaryType)),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "${_secundaryType.toUpperCase()}",
                                    style: TextStyle(
                                        color: TypesPokemon.colorText(
                                            _primaryType),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 10.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: TypesPokemon.colorText(_primaryType),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.40,
                          child: CustomTextFormField(
                            labelText: "HEIGHT",
                            typeKeyboard: TextInputType.phone,
                            controller: controller.heightController,
                            image: "assets/images/stats/height.png",
                            color: TypesPokemon.colorText(_primaryType),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.40,
                          child: CustomTextFormField(
                            labelText: "WEIGHT",
                            typeKeyboard: TextInputType.phone,
                            controller: controller.weightController,
                            image: "assets/images/stats/weight.png",
                            color: TypesPokemon.colorText(_primaryType),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.4,
                          child: CustomTextFormField(
                            labelText: "HP",
                            typeKeyboard: TextInputType.phone,
                            controller: controller.hpController,
                            image: "assets/images/stats/hp.png",
                            color: TypesPokemon.colorText(_primaryType),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                          child: CustomTextFormField(
                            labelText: "MANA",
                            typeKeyboard: TextInputType.phone,
                            controller: controller.manaController,
                            image: "assets/images/stats/mana.png",
                            color: TypesPokemon.colorText(_primaryType),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.4,
                          child: CustomTextFormField(
                            labelText: "ATTACK",
                            typeKeyboard: TextInputType.phone,
                            controller: controller.attackController,
                            image: "assets/images/stats/attack.png",
                            color: TypesPokemon.colorText(_primaryType),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                          child: CustomTextFormField(
                            labelText: "DEFENSE",
                            typeKeyboard: TextInputType.phone,
                            controller: controller.defenseController,
                            image: "assets/images/stats/defense.png",
                            color: TypesPokemon.colorText(_primaryType),
                          ),
                        ),
                      ],
                    ),
                    /* _pokemon is PokemonClass
                        ? CustomButton("SALVAR AMPLIFY", () {
                            controller.savePokemonApiToAmplify(_pokemon);
                            _homeController.getPokemonListAmplify();
                          })
                        : Container() */
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
