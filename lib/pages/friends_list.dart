import 'package:flutter/material.dart';

import 'package:ease/constants.dart';
import 'package:ease/widgets/drawer_widget.dart';

class FriendsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: GetDrawerWidget(),
      appBar: AppBar(
        title: Text("Friends"),
        centerTitle: true,
        backgroundColor: drawerColour,
      ),
    body: Center(
      child: Text("You have no friends!"),
      ),
    );
}
