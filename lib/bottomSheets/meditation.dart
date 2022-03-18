import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:just_audio/just_audio.dart';

class MeditationBottom extends StatefulWidget {
  const MeditationBottom({Key? key}) : super(key: key);

  @override
  State<MeditationBottom> createState() => _MeditationBottomState();
}

class _MeditationBottomState extends State<MeditationBottom> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              child: ElevatedButton(
                onPressed: () async {
                  await player.setAsset('assets/Meditate.mp3');
                  player.play();
                },
                child: Text('Meditate',
                    style: TextStyle(fontSize: 30, color: HexColor("#4166F5"))),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(50),
                  primary: Colors.grey, // <-- Button color
                  onPrimary: Colors.lightGreenAccent, // <-- Splash color
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text('Click to Meditate',
                style: TextStyle(
                  fontSize: 20,
                  color: HexColor("#4166F5"),
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  'Close your eyes. Sit on the floor and listen to the sound. Also this is a 5 minute Meditation. Dont loose focus. Do this everyday. Eventually you will feel extremely good. Your depression, anxiety and all tensions will get controlled.',
                  style: TextStyle(
                    fontSize: 15,
                    color: HexColor("#4166F5"),
                    fontWeight: FontWeight.w500,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
