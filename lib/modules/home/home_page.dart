import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/constants/app_constants.dart';
import 'package:pokedex_app/app/widgets/custom_drawer.dart';
import 'package:pokedex_app/app/widgets/pokemon_tile.dart';
import 'package:pokedex_app/models/Pokemon.dart';

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
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        controller: controller.scrollController2,
        itemCount: controller.pokemonsAmplify.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10.0,
        ),
        itemBuilder: (context, index) {
          return _buildRowItem(context, index);
        },
      ),
    );
  }

  _buildRowItem(context, index) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(controller.pokemonsAmplify[index].id),
      background: _buildBgDeleteItem(),
      onDismissed: (direction) async {
        await controller
            .removePokemonAmplify(controller.pokemonsAmplify.elementAt(index));
      },
      child: PokemonTile(controller.pokemonsAmplify.elementAt(index)),
    );
  }

  _buildBgDeleteItem() {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.only(right: 15.0),
      color: Colors.redAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            "REMOVER",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          Icon(
            Icons.delete,
            color: Colors.white,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
