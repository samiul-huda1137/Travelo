import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelo/pages/bar_item.dart';
import 'package:travelo/pages/home_page.dart';
import 'package:travelo/pages/profile_page.dart';
import 'package:travelo/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    ItemPage(),
    SearchPage(),
    ProfilePage()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label:"Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Bar", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label:"Home", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:"Home", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
