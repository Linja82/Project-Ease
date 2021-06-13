import 'package:ease/constants.dart';
import 'package:ease/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: GetDrawerWidget(),
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: mainColour,
      )
  );
}