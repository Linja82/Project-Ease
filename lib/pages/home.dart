import 'package:ease/constants.dart';
import 'package:ease/pages/login.dart';
import 'package:ease/widgets/logged_in_widget.dart';
import 'package:ease/widgets/drawer_widget.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: GetDrawerWidget(),
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return LoggedInWidget();
        } else if (snapshot.hasError) {
          return Center(child: Text("Something went wrong!"));
        } else {
          return LoginPage();
        }
      },
    ),
  );
}
