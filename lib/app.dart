import 'package:ease/constants.dart';
import 'package:ease/pages/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ease",
      theme: ThemeData(
        primaryColor: mainColour
      ),
      home: LoginScreen()
    );
  }
}
