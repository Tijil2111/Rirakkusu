// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:reduceo/Pages/blogs.dart';

import 'package:reduceo/Pages/main_home.dart';
import 'package:reduceo/Pages/reduceo.dart';
import 'package:reduceo/Pages/tour.dart';

import 'Pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(
      null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights:true,
            enableVibration: true
        )
      ]
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
          routes: {
            '/main': (context) => const MainHome(),
            '/blogs': (context) => Blogs(),
            '/reduceo': (context) => ReduceoPage(),
            '/tour': (context) => Tour(),
          },
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
              duration: 2000,
              splash: Text('Reduceo',
                  style: TextStyle(
                      fontSize: 35,
                      color: HexColor("#80E7FA"),
                      fontWeight: FontWeight.bold)),
              nextScreen: Wrapper(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.white
          )
  );
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
