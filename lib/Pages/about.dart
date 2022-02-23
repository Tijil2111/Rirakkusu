// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/main');
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.deepOrangeAccent,
              size: 16,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            ClipRRect(
              child: Image(
                image: AssetImage('assets/user.png'),
                height: 200,
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
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Check your Unique ID',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.solidEye),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Your UID',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      content: Text(
                        'Dont Share it. Your UID : ${user?.uid}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    );
                  },
                );
              },
              label: const Text('Reveal It'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                minimumSize: const Size(300, 50),
              ),
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
                      title: Text(
                        'Are You Sure ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
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
                              primary: Colors.deepOrangeAccent,
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
                              primary: Colors.deepOrangeAccent,
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
                primary: Colors.deepOrangeAccent,
                minimumSize: const Size(300, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
