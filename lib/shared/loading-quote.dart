// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

class LoadingQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          SpinKitThreeInOut(
            color: HexColor("#4166F5"),
            size: 30.0,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Quickly Loading...',
            style: TextStyle(
              color: HexColor("#4166F5"),
              fontSize: 15,
            ),
          ),
        ],
      )),
    );
  }
}
