import 'package:flutter/material.dart';
import 'package:wall_moods/screens/navigation_center.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurple, textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.deepPurple),
      ),
      home: NavigationCenter(),
    );
  }
}

