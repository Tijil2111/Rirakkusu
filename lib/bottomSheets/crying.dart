import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CryBottom extends StatefulWidget {
  const CryBottom({Key? key}) : super(key: key);

  @override
  State<CryBottom> createState() => _CryBottomState();
}

class _CryBottomState extends State<CryBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Crying isnt the solution !',
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
                'Lets discover what made you cry ? A wise man said that Discovering the cause behind the problem is the solution. Is it a person who said rubbish to you ? If yes then just ignore him/her. Or maybe you got a scolding from your parents ? If yes then whatever they did they wanna make your future bright. Start thinking about the things that make happiness in your life and then asses all things and you will find the beauty of your life.',
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
