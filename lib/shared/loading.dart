// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 350,
          ),
          SpinKitThreeInOut(
            color: Colors.deepOrange,
            size: 30.0,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Loading Some Stories....',
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 15,
            ),
          ),
        ],
      )),
    );
  }
}
