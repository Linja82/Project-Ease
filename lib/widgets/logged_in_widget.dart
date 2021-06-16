import 'package:ease/constants.dart';
import 'package:ease/widgets/drawer_widget.dart';
import 'package:ease/pages/home.dart';
import 'package:ease/pages/my_to_do.dart';
import 'package:ease/pages/friends_list.dart';
import 'package:ease/pages/friends_list2.dart';
import 'package:ease/pages/leaderboard.dart';
import 'package:ease/pages/settings.dart';
import 'package:ease/pages/store.dart';
import 'package:ease/model/navigation_item.dart';
import 'package:ease/providers/navigation_provider.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GetDrawerWidget(),
      appBar: AppBar(
          title: Icon(
            FontAwesomeIcons.crown,
            color: Colors.yellow,
            size: 30,
          ),
          backgroundColor: mainbackgroundColour,
          centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        // gradient background colour
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: backgroundColour,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(user.displayName!,
                style: TextStyle(
                  color: Colors.yellow,
                  fontFamily: "Bungee",
                  fontSize: 30,
                )),
            SizedBox(height: 10),
            Container(
              alignment: Alignment(0.9,0),
              child: CircleAvatar(
                backgroundColor: mainColour,
                radius: 80,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Method to change the pages according to what is selected in the drawer
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
      case NavigationItem.todo_list:
        return myToDo();
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