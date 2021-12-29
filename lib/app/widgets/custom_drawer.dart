import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends GetView {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/pokedex.png"),
                    radius: 50.0,
                  ),
                ),
                const SizedBox(height: 50.0),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Fellipe Augusto Prates',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + const Alignment(0, .8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Desenvolvedor Flutter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('fellipeptc@hotmail.com'),
          ),
          const ListTile(
            leading: Icon(Icons.work),
            title: Text('GitHub - fellipeptc'),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'Aplicativo didático apresenta a lista de pokemóns utilizando GetX e Amplify da AWS.',
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
