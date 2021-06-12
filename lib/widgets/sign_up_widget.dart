import 'package:ease/providers/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Welcome Back to Ease",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Login to  your account to continue",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Spacer(),
        ElevatedButton.icon( // Gmail Sign up
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            onPrimary: Colors.white,
            minimumSize: Size(double.infinity, 50)
          ),
          icon:FaIcon(FontAwesomeIcons.google),
          label: Text("Sign Up with Google"),
          onPressed: () {
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
        ),
        SizedBox(height: 75),
      ]
    ),
  );
}
