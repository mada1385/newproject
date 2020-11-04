import 'package:flutter/material.dart';
import 'package:gulf_football/screens/countrylistscreen.dart';
import 'package:gulf_football/screens/gamescreen.dart';
import 'package:gulf_football/screens/newsscrren.dart';
import 'package:gulf_football/screens/profileoptions.dart';
import 'package:gulf_football/screens/signupscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Signupscreen(),
    );
  }
}
