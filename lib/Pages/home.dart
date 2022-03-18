// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:reduceo/bottomSheets/angry.dart';
import 'package:reduceo/bottomSheets/crying.dart';
import 'package:reduceo/bottomSheets/happy.dart';
import 'package:reduceo/bottomSheets/sad.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Rirakkusu',
                style: TextStyle(
                  color: HexColor("#4166F5"),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'How are you feeling today ?',
                      style: TextStyle(
                        color: HexColor("#4166F5"),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 95.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 700,
                                      child: const HappyBottom(),
                                    );
                                  });
                            },
                            child: Text(
                              '😀',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 700,
                                      child: const AngryBottom(),
                                    );
                                  });
                            },
                            child: Text(
                              '😡',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 700,
                                      child: const CryBottom(),
                                    );
                                  });
                            },
                            child: Text(
                              '😭',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 700,
                                      child: const SadBottom(),
                                    );
                                  });
                            },
                            child: Text(
                              '☹️',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Top Activites',
                style: TextStyle(
                  color: HexColor('#4166F5'),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 130,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 3,
                        color: HexColor("#F7FDFF"),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Text(
                              'Wanna Relax ?',
                            ),
                          ),
                          subtitle: Text(
                            'Relaxing is the best way to reduce stress',
                          ),
                        ),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                      child: Container(
                        height: 130,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 3,
                          color: HexColor("#F6FDF8"),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Text(
                                'Maybe Meditate ?',
                              ),
                            ),
                            subtitle: Text(
                              'Why dont you start meditation ?',
                            ),
                          ),
                        ),
                      ),
                      flex: 2),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/blogs');
                },
                child: Container(
                  height: 130,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3,
                    color: HexColor("#4166F5"),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'What are other people speaking ?',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Read some awesome blogs ! Other people are telling their problems.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/reduceo');
                },
                child: Container(
                  height: 130,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 3,
                    color: HexColor("#4166F5"),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Go and do some tasks !',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Add reminders ! Do tasks these will help you in all ways !!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
