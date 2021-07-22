import 'package:flutter/material.dart';
import 'package:wall_moods/screens/popular_screen.dart';
import 'package:wall_moods/screens/search_screen.dart';
import 'package:wall_moods/screens/wallpaper_screen.dart';

class NavigationCenter extends StatefulWidget {

  @override
  _NavigationCenterState createState() => _NavigationCenterState();
}

class _NavigationCenterState extends State<NavigationCenter> {

  int currentIndex = 0;

  final navBarItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label:"home"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label:"search"),
    BottomNavigationBarItem(icon: Icon(Icons.query_stats), label:"popular"),
  ];

  final List _screens = <Widget>[
    WallpaperScreen(),
    SearchScreen(),
    PopularScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Wall moods"),
      ),
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.deepPurple,
      currentIndex: currentIndex,
      items: navBarItem,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
        print(currentIndex);
      },
    ),
    );
  }
}
