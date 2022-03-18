import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(color: HexColor("#4166F5")),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: HexColor("#4166F5"), width: 2)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: HexColor("#4166F5"), width: 2)),
);
