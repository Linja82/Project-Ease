import 'package:ease/constants.dart';
import 'package:flutter/material.dart';
import 'package:ease/providers/auth_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            new Container(
              width: 250.0,
              height: 250.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/icon.gif"))
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text("LOG-IN",
                style: TextStyle(
                  color: mainColour,
                  fontFamily: "Bungee",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    final provider = Provider.of<Authentication>(context, listen: false);
                    provider.signInWithGoogle();
                  },
                  label: Text("Login with Google"),
                  icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                ),
            ),
            Spacer(),
        ]
      )
    );
  }
}
