// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:reduceo/Pages/home.dart';
import 'package:reduceo/Pages/main_home.dart';

import 'Pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
          routes: {
            '/main': (context) => const MainHome(),
          },
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
              duration: 2000,
              splash: Text('Reduceo',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold)),
              nextScreen: Wrapper(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.white));
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainHome();
          } else {
            return LoginScreen();
          }
        },
      ));
}
