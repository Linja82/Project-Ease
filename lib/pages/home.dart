import 'package:ease/widgets/logged_in_widget.dart';
import 'package:ease/widgets/sign_up_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold (
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(), // If user signs in/out, widget is rebuilt
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return LoggedInWidget();
        } else if (snapshot.hasError) {
          return Center(child: Text('Sorry, something went Wrong!'));
        } else {
          return SignUpWidget();
        }
      },
    ),
  );
}