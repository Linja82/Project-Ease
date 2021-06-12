import 'package:flutter/material.dart';
import 'package:ease/providers/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:ease/pages/home.dart';

class LoginScreen extends StatelessWidget {
static final String title = "MainPage";

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider (
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData.dark().copyWith(accentColor: Colors.indigo),
          home: HomeScreen(),
      ),
  );
}
