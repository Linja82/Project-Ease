import 'package:ease/providers/navigation_provider.dart';
import 'package:ease/providers/auth_provider.dart';
import 'package:ease/widgets/logged_in_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Authentication(),
      ),
      ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
      ),
    ],
    
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ease",
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: HomeScreen(),
    ),
  );

}

