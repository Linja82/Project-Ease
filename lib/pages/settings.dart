import 'package:flutter/material.dart';

import 'package:ease/constants.dart';
import 'package:ease/widgets/drawer_widget.dart';


class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: GetDrawerWidget(),
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: drawerColour,
      ),
  );
}
