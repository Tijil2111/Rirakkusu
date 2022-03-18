// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reduceo/Pages/about.dart';
import 'package:reduceo/Pages/blogs.dart';
import 'package:reduceo/Pages/home.dart';
import 'package:reduceo/Pages/reduceo.dart';
import 'package:reduceo/bottomSheets/addBlog.dart';
import 'package:hexcolor/hexcolor.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    ReduceoPage(),
    Blogs(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColor("#4166F5"),
          elevation: 40,
          foregroundColor: Colors.white,
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 700,
                    child: AddBlog(),
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: HexColor("#4166F5"),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_emotions,
                  size: 30,
                  color: HexColor("#4166F5"),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_online_outlined,
                  size: 30,
                  color: HexColor("#4166F5"),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: HexColor("#4166F5"),
                ),
                label: ''),
          ],
          elevation: 5.0,
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
