import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Tour extends StatefulWidget {
  const Tour({Key? key}) : super(key: key);

  @override
  State<Tour> createState() => _TourState();
}

class _TourState extends State<Tour> {
  @override
  final pageList = [
    PageModel(
      color: Colors.white,
      heroImagePath: 'assets/sad.png',
      title: Text('Be Stress Free',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: HexColor("#4166F5"),
            fontSize: 34.0,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            'Our Rirakkusu Page provides the best in class method of reducing stress via meditation',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexColor("#4166F5"),
              fontSize: 18.0,
            )),
      ),
      icon: Icon(
        Icons.emoji_emotions,
        color: HexColor("#4166F5"),
      ),
    ),
    PageModel(
      color: Colors.white,
      heroImagePath: 'assets/blog.png',
      title: Text('Blogs and Blogs',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: HexColor("#4166F5"),
            fontSize: 34.0,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            'Write your Stories share them with people and read their stories to get inspired ! ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexColor("#4166F5"),
              fontSize: 18.0,
            )),
      ),
      icon: Icon(
        Icons.app_shortcut_sharp,
        color: HexColor("#4166F5"),
      ),
    ),
    PageModel(
      color: Colors.white,
      heroImagePath: 'assets/friends.png',
      title: Text('Add Reminders',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: HexColor("#4166F5"),
            fontSize: 34.0,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            'Dont have time for meditation use are brand new reminder feature',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexColor("#4166F5"),
              fontSize: 18.0,
            )),
      ),
      icon: Icon(
        Icons.alarm_add_rounded,
        color: HexColor("#4166F5"),
      ),
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonTextStyle: TextStyle(
          color: HexColor("#4166F5"),
        ),
        skipButtonTextStyle: TextStyle(
          color: HexColor("#4166F5"),
        ),
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/main'),
        onSkipButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/main'),
      ),
    );
  }
}
