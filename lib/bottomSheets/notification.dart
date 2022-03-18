import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math';

import '../shared/constants.dart';

class NotificationSetter extends StatefulWidget {
  const NotificationSetter({Key? key}) : super(key: key);

  @override
  State<NotificationSetter> createState() => _NotificationSetterState();
}

class _NotificationSetterState extends State<NotificationSetter> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Allow Notifications'),
              content: Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Set Your Notifications !',
          style: TextStyle(
            color: HexColor("#4166F5"),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                color: HexColor('#4166F5'),
                elevation: 10,
                onPressed: () async {
                  Random random = new Random();

                  int randomNumber = random.nextInt(10000);
                  String timezone =
                      await AwesomeNotifications().getLocalTimeZoneIdentifier();
                  await AwesomeNotifications().createNotification(
                    content: NotificationContent(
                        id: randomNumber,
                        channelKey: 'key1',
                        title: 'Tada Time for some Meditation',
                        body: 'It is time for your hourly meditation session'),
                    schedule: NotificationInterval(
                        interval: 3600, timeZone: timezone, repeats: false),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('We will remind you in an hour '),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text(
                  'Get Reminded',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                'Use this to get reminded for your next meditation session. Currently this places a reminder for an hour. But in the next release and the version we will add an option to add custom time.',
                textAlign: TextAlign.center,
                style: TextStyle(color: HexColor('#4166F5'), fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
