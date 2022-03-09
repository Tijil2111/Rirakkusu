// ignore_for_file: sized_box_for_whitespace, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reduceo/bottomSheets/login_bottom.dart';
import 'package:reduceo/bottomSheets/register_bottom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0.0),
              child: Container(
                height: 250,
                child: ClipRRect(
                  child: SvgPicture.asset(
                    'assets/login.svg',
                  ),
                  borderRadius: BorderRadius.circular(190),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Reduceo',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                )),
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                'Your best companion to connect you to people around the world. And to reduce your tension and stress.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepOrange,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.solidEnvelope),
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 700,
                        child: const LoginBottomSheet(),
                      );
                    });
              },
              label: const Text('Login With Mail'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange, minimumSize: const Size(300, 50)),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.solidEnvelope),
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 700,
                          child: const RegisterBottom(),
                        );
                      });
                },
                label: const Text('Register With Mail'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    minimumSize: const Size(300, 50))),
          ],
        )));
  }
}
