// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print, annotate_overrides

import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:reduceo/shared/constants.dart';

class RegisterBottom extends StatefulWidget {
  const RegisterBottom({Key? key}) : super(key: key);

  @override
  _RegisterBottomState createState() => _RegisterBottomState();
}

class _RegisterBottomState extends State<RegisterBottom> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var error = "";

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/tour');
    } on FirebaseAuthException catch (e) {
      print(e);
      error =
          "Enter a valid Email/Maybe the email is already in use or Minimum of 6 character long Password";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                child: Image(
                  image: AssetImage('assets/wave.png'),
                  color: HexColor("#4166F5"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 230.0),
                child: Text("Hola Friend !",
                    style: TextStyle(
                      color: HexColor("#4166F5"),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 185.0),
                child: Text("Lets get you registered",
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
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  style: TextStyle(
                    color: HexColor("#4166F5"),
                  ),
                  controller: emailController,
                  cursorColor: HexColor("#4166F5"),
                  textInputAction: TextInputAction.next,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Email Address'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(
                    color: HexColor("#4166F5"),
                  ),
                  controller: passwordController,
                  cursorColor: HexColor("#4166F5"),
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.lock),
                onPressed: () {
                  signUp();
                  notifications();
                },
                label: const Text('Securely Register'),
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#4166F5"),
                  minimumSize: const Size(300, 50),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
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
