// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print, annotate_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    } on FirebaseAuthException catch (e) {
      print(e);
      error =
          "Enter a valid Email/Maybe the email is already in use or Minimum of 6 character long Password";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            ClipRRect(
              child: Image(
                image: AssetImage('assets/wave.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230.0),
              child: Text("Hola Friend !",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 185.0),
              child: Text("Lets get you registered",
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                controller: emailController,
                cursorColor: Colors.deepOrange,
                textInputAction: TextInputAction.next,
                decoration:
                    textInputDecoration.copyWith(hintText: 'Email Address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: passwordController,
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
                signUp();
              },
              label: const Text('Securely Register'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
                minimumSize: const Size(300, 50),
              ),
            ),
            SizedBox(
              height: 15,
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
            )
          ],
        ),
      ),
    );
  }
}
