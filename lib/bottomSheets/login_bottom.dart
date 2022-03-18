// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_catch_clause, annotate_overrides

import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reduceo/shared/constants.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  _LoginBottomSheetState createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var error = "";

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      error = "Either the Email or the Password is Incorrect";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            ClipRRect(
                child: Image(
              image: AssetImage('assets/wave.png'),
              color: HexColor("#4166F5"),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 190.0),
              child: Text("Welcome Back !",
                  style: TextStyle(
                    color: HexColor("#4166F5"),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 130.0),
              child: Text("We are so excited to see you !",
                  style: TextStyle(
                    color: HexColor("#4166F5"),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                cursorColor: HexColor("#4166F5"),
                style: TextStyle(
                  color: HexColor("#4166F5"),
                ),
                textInputAction: TextInputAction.next,
                decoration:
                    textInputDecoration.copyWith(hintText: 'Email Address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                style: TextStyle(
                  color: HexColor("#4166F5"),
                ),
                cursorColor: HexColor("#4166F5"),
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.lock),
              onPressed: () {
                signIn();
                notifications();
              },
              label: const Text('Securely Login'),
              style: ElevatedButton.styleFrom(
                primary: HexColor("#4166F5"),
                minimumSize: const Size(300, 50),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

void notifications() async {
  Random random = new Random();

  int randomNumber = random.nextInt(10000);
  String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: randomNumber,
        channelKey: 'key1',
        title: 'Look what is cooking in the app !',
        body:
            'People are adding new blogs ! Why dont you add yours and read theirs ? '),
    schedule: NotificationInterval(
        interval: 36000, timeZone: timezone, repeats: true),
  );
}
