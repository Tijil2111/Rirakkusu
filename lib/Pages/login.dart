import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reduceo/bottomSheets/login_bottom.dart';

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
              child: ClipRRect(
                child: Image.asset('assets/login.png'),
                borderRadius: BorderRadius.circular(190),
              ),
            ),
            const Text('Reduceo',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                'Your best companion to connect you to people around the world. And to reduce your tension and stress.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
                        child: LoginBottomSheet(),
                      );
                    });
              },
              label: const Text('Login With Mail'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  minimumSize: const Size(300, 50)),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.solidEnvelope),
                onPressed: () {},
                label: const Text('Register With Mail'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    minimumSize: const Size(300, 50))),
          ],
        )));
  }
}
