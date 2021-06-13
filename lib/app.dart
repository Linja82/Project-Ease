import 'package:ease/pages/home.dart';
import 'package:ease/pages/friends_list.dart';
import 'package:ease/pages/friends_list2.dart';
import 'package:ease/pages/leaderboard.dart';
import 'package:ease/pages/settings.dart';
import 'package:ease/pages/store.dart';
import 'package:ease/model/navigation_item.dart';
import 'package:ease/providers/navigation_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ease",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.home:
        return HomePage();
      case NavigationItem.friends:
        //return FriendsList();
        return FriendListTwo();
      case NavigationItem.leaderboard:
        return LeaderBoard();
      case NavigationItem.store:
        return StorePage();
      case NavigationItem.settings:
        return SettingsPage();
    }

  }

}