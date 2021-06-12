import 'package:ease/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ease/providers/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello " + user.displayName! + "!"),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text("Logout"),
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: mainColour),
                child: Text("Hello " + user.displayName!)
              ),
              ListTile(
                title: Text("Todo List"),
                onTap: () {

                },
              ),
            ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Home Page",
            style: TextStyle(fontSize: 24),
            ),
          SizedBox(height: 32),
          CircleAvatar(radius: 40,
            backgroundImage: NetworkImage(user.photoURL!),
            ),
              SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
