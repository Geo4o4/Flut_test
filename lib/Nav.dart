import 'package:flutter/material.dart';
import 'package:api/home.dart';
import 'package:api/profile.dart';
import 'package:api/settings.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<StatefulWidget> createState() => _HomeNavState();

}
List<Widget> Screen = [
  Home(),
  profile(),
  settings(),
];
class _HomeNavState extends State<HomeNav> {
  int CurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      title: Center(child: Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)),
    ),
    body: Center(child: Screen[CurrentIndex]),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: CurrentIndex,
        onTap: (value){
          CurrentIndex = value;
          setState(() {

          });
        },
        items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),

    ]),
  );
  }

}