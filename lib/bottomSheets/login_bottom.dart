// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_catch_clause, annotate_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reduceo/shared/constants.dart';

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
            )),
            Padding(
              padding: const EdgeInsets.only(right: 190.0),
              child: Text("Welcome Back !",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 130.0),
              child: Text("We are so excited to see you !",
                  style: TextStyle(
                    color: Colors.deepOrange,
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
                cursorColor: Colors.deepOrange,
                style: TextStyle(color: Colors.red),
                textInputAction: TextInputAction.next,
                decoration:
                    textInputDecoration.copyWith(hintText: 'Email Address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.red),
                cursorColor: Colors.deepOrange,
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
              },
              label: const Text('Securely Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
                minimumSize: const Size(300, 50),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              error,
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
