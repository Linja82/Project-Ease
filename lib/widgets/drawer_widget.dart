import 'package:ease/constants.dart';
import 'package:ease/model/navigation_item.dart';
import 'package:ease/providers/auth_provider.dart';
import 'package:ease/providers/navigation_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class GetDrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Drawer(
      child: Container(
        color: drawerColour,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: mainColour,
                  image: DecorationImage(
                    image: AssetImage('assets/images/icon.gif'),
                    fit: BoxFit.contain,
                    alignment: Alignment(1,0)
                  ),
                ),
                child: ListView(padding: EdgeInsets.zero),
            ),
            buildMenuItem(
              context,
              item: NavigationItem.home,
              text: "Home",
              icon: Icons.home,
            ),
            buildMenuItem(
              context,
              item: NavigationItem.todo_list,
              text: "To do List",
              icon: Icons.list,
            ),
            buildMenuItem(
              context,
              item: NavigationItem.friends,
              text: "Friends",
              icon: Icons.people,
            ),
            buildMenuItem(
              context,
              item: NavigationItem.leaderboard,
              text: "Leaderboard",
              icon: Icons.emoji_events,
            ),
            buildMenuItem(
              context,
              item: NavigationItem.store,
              text: "Store",
              icon: Icons.shopping_bag,
            ),
            SizedBox(height: 24),
            buildMenuItem(
              context,
              item: NavigationItem.settings,
              text: "Settings",
              icon: Icons.settings,
            ),
            ListTile(
              trailing: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Logout",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,),
                        ),
                        content: Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(onPressed: () {
                            final provider = Provider.of<Authentication>(context, listen: false);
                            provider.signOut();
                            Navigator.pop(context);
                          },
                              child: Text("Yes")),
                          TextButton(onPressed: () {Navigator.pop(context);}, child: Text("No")),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );

  // Build List Tile
  Widget buildMenuItem(
      BuildContext context, {
        required NavigationItem item,
        required String text,
        required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.orangeAccent : Colors. white;

    return Material(
        color: Colors.transparent,
        child: ListTile(
          selected: isSelected,
          selectedTileColor: Colors.white24,
          leading: Icon(icon, color: color),
          title: Text(text, style: TextStyle(color: color, fontFamily: "Bungee", fontSize: 18)),
          onTap: () {
            selectItem(context, item);
          },
        )
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

}
