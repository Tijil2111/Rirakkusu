// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reduceo/Pages/about.dart';
import 'package:reduceo/Pages/blogs.dart';
import 'package:reduceo/Pages/home.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    Blogs(),
    AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.deepOrangeAccent,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message_outlined,
                  size: 30,
                  color: Colors.deepOrangeAccent,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.deepOrangeAccent,
                ),
                label: ''),
          ],
          selectedItemColor: Colors.black,
          elevation: 5.0,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
