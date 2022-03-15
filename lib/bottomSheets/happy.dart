import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HappyBottom extends StatefulWidget {
  const HappyBottom({Key? key}) : super(key: key);

  @override
  State<HappyBottom> createState() => _HappyBottomState();
}

class _HappyBottomState extends State<HappyBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Being Happy !',
          style: TextStyle(color: HexColor("#80E7FA")),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'You know what this is awesome ! You are happy ! Being happy is an essential essence of being a better person. We would like to recommend you to write some articles to help other people how they can be happy. Just be happy like this and remember Live Life King Size. <3 ',
                style: TextStyle(
                  fontSize: 20,
                  color: HexColor("#80E7FA"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
