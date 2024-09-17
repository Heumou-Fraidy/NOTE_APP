import 'package:first_flutter_project/pages/setting_page.dart';
import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
    children: [
      //header
      const DrawerHeader(
        child: Icon(Icons.house),
      ),
      //notes tile
    DrawerTile(
      title: "Notes",
       leading: const Icon(Icons.home),
        onTap: () => Navigator.pop(context),
    ),

      //settings tile
       DrawerTile(
      title: "Settings",
       leading: const Icon(Icons.settings),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(),
          ),
          );
        },
    ),


      //ai tiles
    ],
    ),
    );
  }
}