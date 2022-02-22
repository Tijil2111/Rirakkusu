// ignore_for_file: avoid_unnecessary_containers

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

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                cursorColor: Colors.deepPurpleAccent,
                textInputAction: TextInputAction.next,
                decoration:
                    textInputDecoration.copyWith(hintText: 'Email Address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                cursorColor: Colors.deepPurpleAccent,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.lock),
                onPressed: () {
                  Navigator.pop(context);
                  signIn();
                },
                label: const Text('Securely Login'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    minimumSize: const Size(300, 50))),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
