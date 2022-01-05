import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/constants/app_constants.dart';
import 'package:pokedex_app/app/widgets/custom_drawer.dart';
import 'package:pokedex_app/models/Pokemon.dart';
import 'package:pokedex_app/modules/home/widgets/pokemon_grid.dart';
import 'package:pokedex_app/modules/home/widgets/pokemon_tile.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawerEdgeDragWidth: 0,
        appBar: AppBar(
          title: const Text(
            "POKEDÉX",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("POKE API"),
              ),
              Tab(
                child: Text("POKE AMPLIFY"),
              ),
            ],
          ),
        ),
        drawer: const CustomDrawer(),
        body: TabBarView(
          children: [
            Obx(() {
              List<Pokemon> list = controller.pokemonsApi.value;
              if (list.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return _buildListViewApi();
              }
            }),
            Obx(() {
              List<Pokemon> list = controller.pokemonsAmplify.value;
              if (list.isEmpty) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.cancel_sharp,
                      size: 100.0,
                      color: AppColors.textColor,
                    ),
                    Text(
                      "SEM DADOS",
                      style:
                          TextStyle(fontSize: 26.0, color: AppColors.textColor),
                    )
                  ],
                ));
              } else {
                return _buildListViewAmplify();
              }
            }),
          ],
        ),
      ),
    );
  }

  _buildListViewApi() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      controller: controller.scrollController,
      itemCount: controller.pokemonsApi.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10.0,
      ),
      itemBuilder: (context, index) {
        if (index + 1 == controller.pokemonsApi.length) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          ));
        }
        return PokemonTile(controller.pokemonsApi.elementAt(index));
      },
    );
  }

  _buildListViewAmplify() {
    return RefreshIndicator(
      onRefresh: () async {
        20.seconds;
        return controller.getPokemonListAmplify();
      },

        child: GridView.count(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          controller: controller.scrollController2,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: controller.pokemonsAmplify
              .map((pokemon) => PokemonGrid(pokemon))
              .toList(),
        ),
    );
  }
}
