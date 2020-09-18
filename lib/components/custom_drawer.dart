import 'package:flutter/material.dart';
import 'package:loja_virtual/components/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerTile(iconData: Icons.home, title: 'Home', page: 0),
          DrawerTile(iconData: Icons.list, title: 'Products', page: 1),
          DrawerTile(iconData: Icons.playlist_add_check, title: 'My Orders', page: 2),
          DrawerTile(iconData: Icons.location_on, title: 'Stores', page: 3),
        ],
      ),
    );
  }
}
