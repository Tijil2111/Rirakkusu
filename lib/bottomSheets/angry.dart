import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AngryBottom extends StatefulWidget {
  const AngryBottom({Key? key}) : super(key: key);

  @override
  State<AngryBottom> createState() => _AngryBottomState();
}

class _AngryBottomState extends State<AngryBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Why Angry ?',
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
                'Lets discover why you are angry. A wise man said that Discovering the cause behind the problem is the solution. Why dont you listen some calm music ? Or maybe do something that you like. For example the creator likes to code and listen to his spotify when he is angry and so do his friends. Some people find peace in studying or solving intriguing problems.',
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
