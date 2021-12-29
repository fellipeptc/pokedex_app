import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/constants/type_pokemons.dart';
import 'package:pokedex_app/app/widgets/custom_button.dart';
import 'package:pokedex_app/app/widgets/custom_drawer.dart';
import 'create_pokemon_controller.dart';

@immutable
class CreatePokemonPage extends GetView<CreatePokemonController> {
  const CreatePokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 0,
      appBar: AppBar(
        title: const Text(
          "POKEDÉX - GETX",
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: const CustomDrawer(),
      body: _buildForm(),
    );
  }

  _buildForm() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                CustomButton(
                  "ESCOLHA O TIPO",
                  () async {
                    await Get.dialog(buildTypesPokemon());
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  "CRIAR POKEMÓN",
                  () {},
                ),
              ],
            ),
          )),
    );
  }

  buildTypesPokemon() {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      title: const Center(
        child: Text(
          "SELECIONE O TIPO",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      content: Container(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          runSpacing: 8.0,
          spacing: 8.0,
          children: typesPokemon
              .map((type) => ActionChip(
                    labelPadding: const EdgeInsets.all(5.0),
                    label: Text(type),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TypesPokemon.colorText(type)),
                    backgroundColor: TypesPokemon.colorBack(type),
                    onPressed: () {
                      controller.typePokemon.value = type;
                      Get.back();
                      Get.snackbar(type, "Tipo escolhido",
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(20.0),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: TypesPokemon.colorBack(type),
                          colorText: TypesPokemon.colorText(type));
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
