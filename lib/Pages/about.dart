// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'About You',
          style: TextStyle(
              color: HexColor("#4166F5"), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/main');
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: HexColor("#4166F5"),
              size: 16,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ClipRRect(
              child: Icon(
                Icons.person,
                size: 152,
                color: HexColor("#4166F5"),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Your email id is ${user?.email}',
                style: TextStyle(
                  fontSize: 20,
                  color: HexColor("#4166F5"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.solidEye),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(
                        'Are You Sure ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#4166F5"),
                        ),
                      ),
                      content: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Nope',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: HexColor("#4166F5"),
                              minimumSize: const Size(40, 50),
                            ),
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              FirebaseAuth.instance.signOut();
                            },
                            child: Text(
                              'Yep !',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: HexColor("#4166F5"),
                              minimumSize: const Size(40, 50),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                primary: HexColor("#4166F5"),
                minimumSize: const Size(300, 50),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.upload),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(
                        'Current version v1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#4166F5"),
                        ),
                      ),
                      content: Text(
                        'If downloaded from Samsung Store it will update automatically.                 '
                        'If downloaded from website check rirakkusu.vercel.app/downloads',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: HexColor("#4166F5"),
                        ),
                      ),
                    );
                  },
                );
              },
              label: const Text('Check Updates'),
              style: ElevatedButton.styleFrom(
                primary: HexColor("#4166F5"),
                minimumSize: const Size(300, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
