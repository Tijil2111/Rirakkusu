import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SadBottom extends StatefulWidget {
  const SadBottom({Key? key}) : super(key: key);

  @override
  State<SadBottom> createState() => _SadBottomState();
}

class _SadBottomState extends State<SadBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Sadness Kills the Happiness',
          style: TextStyle(color: HexColor("#4166F5")),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'A wise man said , life is not about emotions it is about how you live it. Being able to discover the reason behind your problems shows your maturity. Being sad has something to do which your brain. Think of brain as a machine and a machine needs repairing. So does your brain. Sadness is often caused due to excess stress caused. Remove that stress and you will fly high. And I would suggest to watch some Anime or listen to cool music. (Great time pass you knnow, wink)',
                style: TextStyle(
                  fontSize: 20,
                  color: HexColor("#4166F5"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
